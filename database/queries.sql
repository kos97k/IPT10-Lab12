CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	complete_name VARCHAR(255),
	email VARCHAR(255) UNIQUE,
	password VARCHAR(255)
);

CREATE TABLE questions (
	id INT AUTO_INCREMENT  PRIMARY KEY,
    	question_item_number INT NOT NULL,
    	question TEXT NOT NULL,
    	choices JSON NOT NULL,
    	correct_answer CHAR(1) NOT NULL,
    	CONSTRAINT chk_correct_answer CHECK (correct_answer IN ('A', 'B', 'C', 'D'))
);

CREATE TABLE exam_attempts (
    attempt_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    exam_items INT NOT NULL,
    exam_score INT NOT NULL,
    attempt_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);


CREATE TABLE exam_answers (
    answer_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    attempt_id INT NOT NULL,
    answers JSON NOT NULL,
    date_answered DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (attempt_id) REFERENCES exam_attempts(attempt_id)
);

INSERT INTO questions
SET
question_item_number=1,
question="What is the capital of France?",
choices='[{"choice": "Berlin", "letter": "A"}, {"choice": "Madrid", "letter": "B"}, {"choice": "Paris", "letter": "C"}, {"choice": "Rome", "letter": "D"}]',
correct_answer='C';

INSERT INTO questions
SET
question_item_number=2,
question="Which planet is known as the Red Planet?",
choices='[{"choice": "Earth", "letter": "A"}, {"choice": "Mars", "letter": "B"}, {"choice": "Jupiter", "letter": "C"}, {"choice": "Venus", "letter": "D"}]',
correct_answer='B';

INSERT INTO questions
SET
question_item_number=3,
question="What is the largest mammal?",
choices='[{"choice": "Elephant", "letter": "A"}, {"choice": "Blue Whale", "letter": "B"}, {"choice": "Giraffe", "letter": "C"}, {"choice": "Rhino", "letter": "D"}]',
correct_answer='B';

INSERT INTO questions
SET
question_item_number=4,
question="How many continents are there on Earth?",
choices='[{"choice": "5", "letter": "A"}, {"choice": "6", "letter": "B"}, {"choice": "7", "letter": "C"}, {"choice": "8", "letter": "D"}]',
correct_answer='C';

INSERT INTO questions
SET
question_item_number=5,
question="Which element has the chemical symbol O?",
choices='[{"choice": "Oxygen", "letter": "A"}, {"choice": "Gold", "letter": "B"}, {"choice": "Silver", "letter": "C"}, {"choice": "Osmium", "letter": "D"}]',
correct_answer='A';
