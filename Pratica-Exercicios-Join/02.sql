SELECT t.id, users.name AS writer, s.name AS recipient, t.message FROM testimonials t JOIN users ON users.id = t."writerId" JOIN users s ON s.id = t."recipientId";