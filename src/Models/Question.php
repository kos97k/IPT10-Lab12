<?php

namespace App\Models;

use App\Models\BaseModel;
use \PDO;

class Question extends BaseModel
{
      // Save a new question to the database
      public function save($data) {
        $sql = "INSERT INTO questions 
                (question_item_number, question, choices, correct_answer) 
                VALUES (:question_item_number, :question, :choices, :correct_answer)";        
        $statement = $this->db->prepare($sql);
        $statement->execute([
            'question_item_number' => $data['question_item_number'],
            'question' => $data['question'],
            'choices' => json_encode($data['choices']), // Ensure choices are JSON encoded
            'correct_answer' => $data['correct_answer']
        ]);

        return $statement->rowCount();
    }

    // Get a question by its item number
    public function getQuestion($question_item_number)
    {
        $sql = "SELECT * FROM questions WHERE question_item_number = :question_item_number";
        $statement = $this->db->prepare($sql);
        $statement->execute([
            'question_item_number' => $question_item_number // Fixed variable reference
        ]);
        $result = $statement->fetch(PDO::FETCH_ASSOC);
        return $result;
    }

    // Get all questions (if needed)
    public function getAllQuestions()
    {
        $sql = "SELECT * FROM questions";
        $statement = $this->db->prepare($sql);
        $statement->execute();
        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    // Count total questions in the database
    public function getTotalQuestions()
    {
        $sql = "SELECT COUNT(id) AS total_questions FROM questions";
        $statement = $this->db->prepare($sql);
        $statement->execute();
        return $statement->fetch(PDO::FETCH_ASSOC)['total_questions'];
    }

    // Compute score based on user answers
    public function computeScore($answers)
    {
        $score = 0;
        $questions = $this->getAllQuestions();
        foreach ($questions as $question) {
            if (isset($answers[$question['question_item_number']]) && 
                $answers[$question['question_item_number']] == $question['correct_answer']) {
                $score++;
            }
        }
        return $score;
    }
}