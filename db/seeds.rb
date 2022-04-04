#Creating Users
User.create({email: 'userteste1@gmail.com', password: '12345678'})
User.create({email: 'userteste2@gmail.com', password: '12345678'})
User.create({email: 'userteste3@gmail.com', password: '12345678'})

#Updating Profile
UserProfile.find(1).update({name: "user", last_name: "Teste1", birthday: '1995-04-03',
                           gender: 0, adress: "Rua Cotoxó", adress_number: "799", adress_complement: "apto 132",
                           country: "Brasil", state: "São Paulo", city: "São Paulo", born_in: "Ribeirão Preto",
                           cpf: "412.447.228-76", rg: "31.239.299-7", rg_issuer: "SSP-SP", deficient: false, mom_name: "Teste1 Mãe", 
                           marital_status: 1})

UserProfile.find(2).update({name: "user", last_name: "Teste2", birthday: '2002-04-03',
                           gender: 2, adress: "Rua Cândido", adress_number: "115", adress_complement: "",
                           country: "Brasil", state: "São Paulo", city: "Ribeirão Preto", born_in: "Ribeirão Preto",
                           cpf: "412.321.567-76", rg: "29.543.132-7", rg_issuer: "SSP-SP", deficient: true, deficient_description: 1, 
                           mom_name: "Teste2 Mãe", marital_status: 2})

UserProfile.find(3).update({name: "user", last_name: "Teste3", birthday: '199-05-05',
                           gender: 3, adress: "Av. Nove de Julho", adress_number: "115", adress_complement: "",
                           country: "Brasil", state: "São Paulo", city: "Ribeirão Preto", born_in: "Rio de Janeiro",
                           cpf: "399.200.135-34", rg: "23.675.346-5", rg_issuer: "SSP-SP", deficient: true, deficient_description: 1, 
                           mom_name: "Teste3 Mãe", marital_status: 3})

#Creating Advisor
Advisor.create({email: 'advisorteste1@gmail.com', password: '12345678'})
Advisor.create({email: 'advisorteste2@gmail.com', password: '12345678'})

#Updating Advisor Profile
AdvisorProfile.find(1).update({name: "Advisor", last_name: "Teste1", birthday: '1995-08-03',
                              gender: 0, adress: "Rua Pio XI", adress_number: "2121", adress_complement: "",
                              country: "Brasil", state: "São Paulo", city: "São Paulo", born_in: "Ribeirão Preto",
                              cpf: "154.448.908-01", rg: "26.377.185-4", rg_issuer: "SSP-SP", deficient: false, mom_name: "ADTeste1 Mãe", 
                              marital_status: 1})

AdvisorProfile.find(2).update({name: "Advisor", last_name: "Teste2", birthday: '2002-04-23',
                              gender: 2, adress: "Rua Cândido", adress_number: "115", adress_complement: "",
                              country: "Brasil", state: "São Paulo", city: "Ribeirão Preto", born_in: "Ribeirão Preto",
                              cpf: "412.321.567-76", rg: "29.543.132-7", rg_issuer: "SSP-SP", deficient: true, deficient_description: 0, 
                              mom_name: "ADTeste2 Mãe", marital_status: 2})

#Creating match
Match.create({advisor_id: 1, user_id: 1, active: false, started_at: '2020-04-03', finished_at: '2022-04-01'})
Match.create({advisor_id: 1, user_id: 2, started_at: '2022-01-15'})

#Creating feedback
AdvisorFeedback.create({grade: 5, match_id: 1,
                        comment:"Se demonstrou um bom assessor durante todo o tempo, estou trocando para um assessor de renda variável"})