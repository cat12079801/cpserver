class Submit < ApplicationRecord
  belongs_to :user
  belongs_to :language
  belongs_to :problem
  has_many :judges, dependent: :destroy

  def show_status
    if self.status == "Judging"
      "Judging (#{self.judges.length}/#{self.problem.test_cases.length})"
    else
      self.status
    end
  end

  def show_point
    if self.status == "AC"
      self.problem.point
    else
      0
    end
  end

  def get_local_time
    a = self.created_at.getlocal
    "#{a.hour.to_s.rjust(2, '0')}:#{a.min.to_s.rjust(2, '0')}.#{a.sec.to_s.rjust(2, '0')}"
  end

  def code_length
    self.code.bytesize.to_s + ' Bytes'
  end

  def max_runtime
    a = self.judges.maximum(:paiza_time)
    if a.nil?
      '-'
    else
      a + ' sec'
    end
  end

  def max_memory
    a = self.judges.maximum(:paiza_memory)
    if a.nil?
      '-'
    else
      a.to_s + ' Bytes'
    end
  end
end
