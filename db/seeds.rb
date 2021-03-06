if Language.first.nil?
  puts "create language data..."
  Language.create(name: "swift",        display: "Swift [Swift version 2.2]")
  Language.create(name: "c",            display: "C [clang 3.6 / LLVM 3.6 (C99)]")
  Language.create(name: "cpp",          display: "C++ [clang 3.6 / LLVM 3.6 / libc++ (C++14)]")
  Language.create(name: "objective-c",  display: "Objective-C [clang 3.6 / LLVM 3.6 / GNUstep 7.7]")
  Language.create(name: "java",         display: "Java [java 1.8.0]")
  Language.create(name: "php",          display: "PHP [php 7.0.1]")
  Language.create(name: "ruby",         display: "Ruby [ruby 2.2.0]")
  Language.create(name: "python",       display: "Python2 [python 2.7.6]")
  Language.create(name: "python3",      display: "Python3 [python 3.4.3]")
  Language.create(name: "perl",         display: "Perl [perl 5.18.2]")
  Language.create(name: "scala",        display: "Scala [Scala 2.11.2]")
  Language.create(name: "go",           display: "Go [go 1.4.2]")
  Language.create(name: "csharp",       display: "C# [mono-3.2.8.0 (C#5, CLI4.5)]")
  Language.create(name: "haskell",      display: "Haskell [GHC 7.6.3]")
  Language.create(name: "clojure",      display: "Clojure [Clojure 1.4.0]")
  Language.create(name: "d",            display: "D [Clojure 1.4.0]")
  Language.create(name: "erlang",       display: "Erlang [Erlang R16B03]")
  Language.create(name: "r",            display: "R [R 3.0.2]")
  Language.create(name: "javascript",   display: "JavaScript [node v4.2.2]")
  Language.create(name: "coffeescript", display: "CoffeeScript [CoffeeScript 1.4.0 / nodejs 4.2.2]")
  Language.create(name: "cobol",        display: "COBOL [OpenCOBOL 1.1.0]")
  Language.create(name: "vb",           display: "VisualBasic [VB.net 0.0.0.5943 / mono-3.2.8.0]")
  Language.create(name: "fsharp",       display: "F# [F# 3.0 (Open Source Edition) / mono-3.2.8.0]")
  Language.create(name: "bash",         display: "Bash [GNU bash 4.3.11]")
  Language.create(name: "mysql",        display: "MySQL [MySQL 5.6.27]")
  puts "finish!"
end

if User.first.nil?
  puts "create user data..."
  User.create(name: "cat", password: "hogehoge", administor: true)
  User.create(name: "test", password: "hogehoge", administor: false)
  puts "finish!"
end

if Problem.first.nil?
  puts "create problem data..."
  20.times do |i|
    Problem.create(name: "Problem#{i}", question: "here details...", point: i*100, opened: i%6!=0)
  end
  puts "finish!"
end

if Submit.first.nil?
  puts "create submit data..."
  status = %w(AC WA RE CE)
  ((User.all.length * Problem.all.length)*5).times do
    Submit.create(user: User.all.sample, language: Language.all.sample, problem: Problem.all.sample, code: "hogehoge", status: status.sample)
  end
  puts "finish!"
end

if TestCase.first.nil?
  puts "create test case data..."
  Problem.all.each do |problem|
    (1..5).to_a.sample.times do |i|
      TestCase.create(problem: problem, input: "input text #{i+1} ...", output: "output text #{i+1} ...")
    end
  end
  puts "finish!"
end
