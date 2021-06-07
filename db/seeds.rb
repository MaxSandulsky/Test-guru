categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }, { title: 'Mobile Development' },
                               { title: 'Machine Learning' }])

users = User.create!([{ login: 'OpenUser', password: 'doAos11-', e_mail: 'sample@mailer.com' },
                      { login: 'Max', password: 'sample', e_mail: 'max@mailer.com' }])

tests = Test.create!([{ category: categories[0], author: users[0], title: 'Ruby for beginners' },
                      { category: categories[1], author: users[0], title: 'HTML for the little ones' },
                      { category: categories[0], author: users[1], title: 'Advanced Rails', level: 1 }])

questions = Question.create!([{ test: tests[0], body: 'In Ruby, everything is ...' },
                              { test: tests[0], body: 'What function do you need to print output to the screen?' },
                              { test: tests[0], body: 'What symbol do you need to commentate the line?' },
                              { test: tests[0], body: 'How to define variable type in Ruby?' },
                              { test: tests[0], body: 'How to define constant in Ruby?' }])

Answer.create!([{ question: questions[0], body: 'function' },
                { question: questions[0], body: 'number' },
                { question: questions[0], body: 'object', correct: true },
                { question: questions[1], body: 'window' },
                { question: questions[1], body: 'outputs' },
                { question: questions[1], body: 'puts', correct: true },
                { question: questions[2], body: '@' },
                { question: questions[2], body: '//' },
                { question: questions[2], body: '#', correct: true },
                { question: questions[3], body: 'Define type before variable' },
                { question: questions[3], body: 'Simply write "var" before variable' },
                { question: questions[3], body: 'Variable type will be determine automatically',
                  correct: true },
                { question: questions[4], body: 'Write "const" before constant' },
                { question: questions[4], body: 'Write "static" before constant' },
                { question: questions[4], body: 'Capitalize constants', correct: true }])

PassedTest.create!([{ user: users[0], test: tests[0] },
                    { user: users[0], test: tests[1] },
                    { user: users[0], test: tests[2] },
                    { user: users[1], test: tests[0] }])
