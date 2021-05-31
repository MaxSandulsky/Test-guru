categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }, { title: 'Mobile Development' },
                               { title: 'Machine Learning' }])

users = User.create!([login: 'OpenUser', password: 'doAos11-', e_mail: 'sample@mailer.com'])

tests = Test.create!([{ category_id: categories[0].id, author_id: users[0].id, title: 'Ruby for beginners' },
                      { category_id: categories[1].id, author_id: users[0].id, title: 'HTML for the little ones' },
                      { category_id: categories[0].id, author_id: users[0].id, title: 'Advanced Rails', level: 1 }])

questions = Question.create!([{ test_id: tests[0].id, body: 'In Ruby, everything is ...' },
                              { test_id: tests[0].id,
                                body: 'What function do you need to print output to the screen?' },
                              { test_id: tests[0].id, body: 'What symbol do you need to commentate the line?' },
                              { test_id: tests[0].id, body: 'How to define variable type in Ruby?' },
                              { test_id: tests[0].id, body: 'How to define constant in Ruby?' }])

answers = Answer.create!([{ question_id: questions[0].id, body: 'function' },
                          { question_id: questions[0].id, body: 'number' },
                          { question_id: questions[0].id, body: 'object', correct: true },
                          { question_id: questions[1].id, body: 'window' },
                          { question_id: questions[1].id, body: 'outputs' },
                          { question_id: questions[1].id, body: 'puts', correct: true },
                          { question_id: questions[2].id, body: '@' },
                          { question_id: questions[2].id, body: '//' },
                          { question_id: questions[2].id, body: '#', correct: true },
                          { question_id: questions[3].id, body: 'Define type before variable' },
                          { question_id: questions[3].id, body: 'Simply write "var" before variable' },
                          { question_id: questions[3].id, body: 'Variable type will be determine automatically',
                            correct: true },
                          { question_id: questions[4].id, body: 'Write "const" before constant' },
                          { question_id: questions[4].id, body: 'Write "static" before constant' },
                          { question_id: questions[4].id, body: 'Capitalize constants', correct: true }])

ptests = PassedTest.create!([{ user_id: users[0].id, test_id: tests[0].id },
                             { user_id: users[0].id, test_id: tests[1].id },
                             { user_id: users[0].id, test_id: tests[2].id }])
