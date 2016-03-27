class JudgeJob < ApplicationJob
  queue_as :default

  def perform(submit)
    submit.problem.test_cases.each do |test_case|
      judge = paiza_create(submit, test_case)

      if judge.status == "ER"
        submit.update(status: "ER")
        break
      elsif judge.status == "NE"
        submit.update(status: "NE")
        break
      end

      while paiza_get_status(judge) == "running"
      end

      result = paiza_get_details(judge)
      if result["build_stderr"].nil?.!
        judge.update(status: "CE", paiza_build_stderr: result["build_stderr"])
        break
      elsif result["stderr"].empty?.!
        judge.update(status: "RE", paiza_stderr: result["stderr"])
        break
      elsif result["stdout"] == test_case.output.gsub("\r\n", "\n")
        judge.update(status: "AC")
      else
        judge.update(status: "WA")
      end
      judge.update(paiza_time: result["time"], paiza_memory: result["memory"], paiza_result: result["result"], output: result["stdout"])
    end

    statuses = submit.judges.pluck(:status).uniq
    if statuses == ["AC"]
      submit.update(status: "AC")
    elsif statuses.include? "ER"
      submit.update(status: "ER")
    elsif statuses.include? "NE"
      submit.update(status: "NE")
    elsif statuses.include? "CE"
      submit.update(status: "CE")
    elsif statuses.include? "RE"
      submit.update(status: "RE")
    else
      submit.update(status: "WA")
    end
  end

  private
    def paiza_create(submit, test_case)
      uri = URI.parse("http://api.paiza.io/runners/create")
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Post.new(uri.request_uri)
      req["Content-Type"] = "application/json"
      json = JSON.generate({
        "source_code" => submit.code,
        "language" => submit.language.name,
        "input" => test_case.input,
        "api_key" => "guest",
      })
      req.body = json

      res = http.request(req)
      res_json = JSON.parse(res.body)
      if res_json["error"].nil?.!
        judge = Judge.create(submit: submit, test_case: test_case, status: "ER")
      elsif res.code == "200" and res.msg == "OK"
        res_json = JSON.parse(res.body)
        judge = Judge.create(submit: submit, test_case: test_case, paiza_api_id: res_json["id"])
      end

      return judge ||= Judge.create(submit: submit, test_case: test_case, status: "NE")
    end

    def paiza_get_status(judge)
      uri = URI.parse("http://api.paiza.io/runners/get_status")
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Get.new(uri.request_uri)
      req["Content-Type"] = "application/json"
      json = JSON.generate({
        "id" => judge.paiza_api_id,
        "api_key" => "guest",
      })
      req.body = json

      res = http.request(req)

      return JSON.parse(res.body)["status"]
    end

    def paiza_get_details(judge)
      uri = URI.parse("http://api.paiza.io/runners/get_details")
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Get.new(uri.request_uri)
      req["Content-Type"] = "application/json"
      json = JSON.generate({
        "id" => judge.paiza_api_id,
        "api_key" => "guest",
      })
      req.body = json

      res = http.request(req)

      return JSON.parse(res.body)
    end
end
