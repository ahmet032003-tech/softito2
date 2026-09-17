DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users(full_name, email) VALUES
('Ahmet Sarsılmaz', 'ahmet@hotmail.com'),
('Ayşe İrade', 'ayse@hotmail.com'),
('Mehmet İradeli', 'mehmet@hotmail.com');

SELECT * FROM users;
UPDATE users SET email = 'ahmetsarsilmaz@hotmail.com' WHERE id = 1;
DELETE FROM users WHERE id = 3;
SELECT * FROM users;