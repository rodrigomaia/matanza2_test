json.array!(@alunos) do |aluno|
  json.extract! aluno, :id
  json.url aluno_url(aluno, format: :json)
end
