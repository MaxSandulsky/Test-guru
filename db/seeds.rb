categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }, { title: 'Mobile Development' },
                               { title: 'Machine Learning' }])

users = User.create!([{ password: 'doAos11-', email: 'sample@mailer.com' },
                      { password: 'sample', email: 'max@mailer.com' }])

tests = Test.create!([{ category: categories[0], author: users[0], title: 'Ruby for beginners' },
                      { category: categories[1], author: users[0], title: 'HTML for the little ones' },
                      { category: categories[0], author: users[1], title: 'Advanced Rails', level: 2 }])

questions = Question.create!([{ test: tests[0], body: 'In Ruby, everything is ...' },
                              { test: tests[0], body: 'What function do you need to print output to the screen?' },
                              { test: tests[0], body: 'What symbol do you need to commentate the line?' },
                              { test: tests[0], body: 'How to define variable type in Ruby?' },
                              { test: tests[0], body: 'How to define constant in Ruby?' },
                              { test: tests[1], body: 'What H is for in HTML?' },
                              { test: tests[1], body: 'Does HTML have not pair tags?' },
                              { test: tests[1], body: 'What is static HTML pages?' },
                              { test: tests[2], body: 'What is ActiveRecords?' },
                              { test: tests[2], body: 'How to add new routes for resource?' },
                              { test: tests[2], body: 'What is partials?' }])

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
                { question: questions[3], body: 'Variable type will be determine automatically', correct: true },
                { question: questions[4], body: 'Write "const" before constant' },
                { question: questions[4], body: 'Write "static" before constant' },
                { question: questions[4], body: 'Capitalize constants', correct: true },
                { question: questions[5], body: 'H for home' },
                { question: questions[5], body: 'H for Hyper', correct: true },
                { question: questions[5], body: 'H for hexagonal' },
                { question: questions[6], body: 'No' },
                { question: questions[6], body: 'Yes', correct: true },
                { question: questions[6], body: 'Dependents on context' },
                { question: questions[7],
                  body: 'Pages written in HTML, CSS, JavaScript and is sending by server without any proccesing', correct: true },
                { question: questions[7], body: 'Static pages are no energy consuming' },
                { question: questions[7],
                  body: 'Static pages generate static electricity every time someone visit a page' },
                { question: questions[8],
                  body: 'Active Record is M in MVC - model - what is a layer in system, provides busines logic', correct: true },
                { question: questions[8], body: 'Records that can actively interract with other application parts' },
                { question: questions[8], body: 'Opposite for passive records' },
                { question: questions[9], body: 'Add resources', correct: true },
                { question: questions[9], body: 'Modify routes.rb file by adding "get /.."', correct: true },
                { question: questions[9], body: 'Define URL in settings' },
                { question: questions[10], body: 'Model records fragments' },
                { question: questions[10], body: 'View fragments', correct: true },
                { question: questions[10], body: 'Fragments of HTML code', correct: true }])

TestPassage.create!(user: users[0], test: tests[0], current_question: questions[0])

badges = Badge.create!(title: 'Backend developer', description: 'Passed all Backend tests',
                       rule: 'tests_by_category', rule_value: categories[0],
                       pic_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdn_G1p0WjnmLpGuWWiL-w_87COmb8wOb6PQ&usqp=CAU')
