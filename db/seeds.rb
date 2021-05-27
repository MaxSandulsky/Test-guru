Category.create([{ title: 'Backend' }, { title: 'Frontend' }, { title: 'Mobile Development' },
                 { title: 'Machine Learning' }])
User.create(login: 'OpenUser', password: 'doAos11-', e_mail: 'sample@mailer.com', tests: [1, 2])
Test.create([{ category_id: 1, author_id: 1, title: 'Ruby for beginners' },
             { category_id: 2, author_id: 1, title: 'HTML for the little ones' }])
Question.create([{ test_id: 1, body: 'In Ruby, everything is ...' },
                 { test_id: 1, body: 'What function do you need to print output to the screen?' },
                 { test_id: 1, body: 'What symbol do you need to commentate the line?' },
                 { test_id: 1, body: 'How to define variable type in Ruby?' },
                 { test_id: 1, body: 'How to define constant in Ruby?' }])
Answer.create([{ question_id: 1, body: 'function' }, { question_id: 1, body: 'number' },
               { question_id: 1, body: 'object', correct: true }, { question_id: 2, body: 'window' },
               { question_id: 2, body: 'outputs' }, { question_id: 2, body: 'puts', correct: true },
               { question_id: 3, body: '@' }, { question_id: 3, body: '//' },
               { question_id: 3, body: '#', correct: true },
               { question_id: 4, body: 'Define type before variable' },
               { question_id: 4, body: 'Simply write "var" before variable' },
               { question_id: 4, body: 'Variable type will be determine automatically', correct: true },
               { question_id: 5, body: 'Write "const" before constant' },
               { question_id: 5, body: 'Write "static" before constant' },
               { question_id: 5, body: 'Capitalize constants', correct: true }])
