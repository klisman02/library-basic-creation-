-- Criar o banco de dados
CREATE DATABASE library_project;

-- Selecionar o banco de dados a ser utilizado
USE library_project;

-- ---------------------------------------------------
-- TABELA: authors
-- ---------------------------------------------------
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    nationality VARCHAR(100),
    sex CHAR(1) CHECK(sex IN ('M', 'F'))
);

-- ---------------------------------------------------
-- TABELA: library_location
-- ---------------------------------------------------
CREATE TABLE library_location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL,
    section VARCHAR(100) NOT NULL
);

-- Selecionar todos os registros da tabela library_location
SELECT * FROM library_location;

-- Alterações na tabela library_location
ALTER TABLE library_location
ADD COLUMN address VARCHAR(100);

ALTER TABLE library_location
DROP COLUMN country_namel,
DROP COLUMN city_namel;

ALTER TABLE library_location
RENAME COLUMN location_name TO street_name;

ALTER TABLE library_location
RENAME COLUMN address TO number;

-- ---------------------------------------------------
-- TABELA: library_employee
-- ---------------------------------------------------
CREATE TABLE library_employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_firstname VARCHAR(50) NOT NULL,
    employee_lastname VARCHAR(50) NOT NULL,
    location_id INT,
    hire_date DATE,
    FOREIGN KEY (location_id) REFERENCES library_location(location_id)
);

-- ---------------------------------------------------
-- TABELA: books
-- ---------------------------------------------------
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_title VARCHAR(200) NOT NULL,
    author_id INT,
    date_of_publication DATE,
    genre VARCHAR(200),
    number_of_pages INT,
    book_description VARCHAR(200),
    location_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (location_id) REFERENCES library_location(location_id)
);

-- ---------------------------------------------------
-- TABELA: users
-- ---------------------------------------------------
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20)
);

ALTER TABLE users
ADD COLUMN address VARCHAR(200) NOT NULL;

-- ---------------------------------------------------
-- TABELA: loans
-- ---------------------------------------------------
CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);



-- ---------------------------------------------------
-- INSERIR DADOS NA TABELA authors
-- ---------------------------------------------------
INSERT INTO authors (author_name, nationality, sex) 
VALUES
('Paulo Coelho', 'Brazilian', 'M'),
('J.K. Rowling', 'Britânica', 'F'),
('Gabriel García Márquez', 'Colombiano', 'M'),
('Haruki Murakami', 'Japonês', 'M'),
('Jane Austen', 'Britânica', 'F'),
('Mark Twain', 'Americano', 'M'),
('Chimamanda Ngozi Adichie', 'Nigeriana', 'F'),
('Ernest Hemingway', 'Americano', 'M'),
('Agatha Christie', 'Britânica', 'F'),
('Leo Tolstoy', 'Russo', 'M'),
('Franz Kafka', 'Checo', 'M'),
('Isabel Allende', 'Chilena', 'F'),
('Virginia Woolf', 'Britânica', 'F'),
('F. Scott Fitzgerald', 'Americano', 'M'),
('Khaled Hosseini', 'Afegão', 'M'),
('Toni Morrison', 'Americana', 'F'),
('Neil Gaiman', 'Britânico', 'M'),
('Clarice Lispector', 'Brasileira', 'F'),
('Mario Vargas Llosa', 'Peruano', 'M'),
('Paulo Freire', 'Brasileiro', 'M'),
('Simone de Beauvoir', 'Francesa', 'F'),
('Harlan Coben', 'Americano', 'M'),
('Margaret Atwood', 'Canadense', 'F'),
('Salman Rushdie', 'Britânico', 'M'),
('C.S. Lewis', 'Britânico', 'M'),
('Stephen King', 'Americano', 'M'),
('George Orwell', 'Britânico', 'M'),
('Doris Lessing', 'Britânica', 'F'),
('Zadie Smith', 'Britânica', 'F'),
('Alice Walker', 'Americana', 'F'),
('Jonathan Safran Foer', 'Americano', 'M'),
('J.R.R. Tolkien', 'Britânico', 'M'),
('John Steinbeck', 'Americano', 'M'),
('Neil Gaiman', 'Britânico', 'M'),
('Don DeLillo', 'Americano', 'M'),
('Jhumpa Lahiri', 'Americana', 'F'),
('Octavia Butler', 'Americana', 'F'),
('Ray Bradbury', 'Americano', 'M'),
('Robert Louis Stevenson', 'Escocês', 'M'),
('Oscar Wilde', 'Irlandês', 'M'); 

-- ---------------------------------------------------
-- INSERIR DADOS NA TABELA library_location
-- ---------------------------------------------------
INSERT INTO library_location (street_name, section, country_name, city_name, number) 
VALUES 
('Rua das Flores', 'Ficção', 'Brasil', 'São Paulo', '123'),
('Avenida Brasil', 'Não-ficção', 'Brasil', 'Rio de Janeiro', '456'),
('Calle de la Libertad', 'Literatura', 'Espanha', 'Madrid', '789'),
('Baker Street', 'Mistério', 'Reino Unido', 'Londres', '101'),
('Champs-Élysées', 'Clássicos', 'França', 'Paris', '202'),
('Rua das Acácias', 'Ficção', 'Brasil', 'Belo Horizonte', '110'),
('Avenida São João', 'Ficção', 'Brasil', 'São Paulo', '222'),
('Rua do Comércio', 'História', 'Brasil', 'Recife', '333'),
('Avenida dos Estados', 'Biografias', 'Brasil', 'Curitiba', '444'),
('Rua da Paz', 'Romance', 'Brasil', 'Fortaleza', '555'),
('Calle Mayor', 'Literatura', 'Espanha', 'Madri', '666'),
('Calle Gran Via', 'Teatro', 'Espanha', 'Madri', '777'),
('Calle de Vallehermoso', 'Poesia', 'Espanha', 'Madri', '888'),
('Avenida Diagonal', 'Não-ficção', 'Espanha', 'Barcelona', '999'),
('Boulevard Saint-Germain', 'Clássicos', 'França', 'Paris', '1010'),
('Rue de Rivoli', 'Romance', 'França', 'Paris', '2020'),
('Viale Trastevere', 'História', 'Itália', 'Roma', '3030'),
('Via del Corso', 'Ficção', 'Itália', 'Roma', '4040'),
('Piazza Navona', 'Arte', 'Itália', 'Roma', '5050');



INSERT INTO library_employee (employee_firstname, employee_lastname, location_id, hire_date)
VALUES 
('Ana', 'Silva', 1, '2023-01-15'),
('João', 'Pereira', 2, '2023-02-10'),
('Maria', 'Souza', 1, '2023-03-05'),
('Carlos', 'Oliveira', 3, '2023-04-20'),
('Fernanda', 'Costa', 2, '2023-05-25'),
('Lucas', 'Almeida', 1, '2023-06-30'),
('Juliana', 'Lima', 3, '2023-07-15'),
('Roberto', 'Martins', 2, '2023-08-10'),
('Patrícia', 'Fernandes', 1, '2023-09-05'),
('Rafael', 'Cardoso', 3, '2023-10-01'),
('Eduardo', 'Machado', 1, '2021-01-10'),
('Sofia', 'Ribeiro', 2, '2021-02-15'),
('Felipe', 'Teixeira', 3, '2021-03-20'),
('Mariana', 'Dias', 1, '2021-04-25'),
('Tiago', 'Pinto', 2, '2021-05-30'),
('Camila', 'Barbosa', 3, '2021-06-15'),
('Renato', 'Nunes', 1, '2021-07-10'),
('Tatiane', 'Farias', 2, '2021-08-05'),
('Gustavo', 'Cavalcante', 3, '2021-09-15'),
('Luciana', 'Azevedo', 1, '2021-10-20');


INSERT INTO books (book_title, author_id, date_of_publication, genre, number_of_pages, book_description, location_id)
VALUES 
('O Alquimista', 1, '1988-01-01', 'Ficção', 208, 'Uma jornada em busca de um tesouro.', 1),
('Harry Potter e a Pedra Filosofal', 2, '1997-06-26', 'Fantasia', 223, 'A história de um jovem bruxo.', 2),
('Cem Anos de Solidão', 3, '1967-05-30', 'Ficção', 417, 'A saga da família Buendía.', 1),
('Norwegian Wood', 4, '1987-09-04', 'Ficção', 296, 'Um romance sobre amor e perda.', 3),
('Orgulho e Preconceito', 5, '1813-01-28', 'Romance', 432, 'Um clássico sobre relacionamentos.', 2),
('As Aventuras de Tom Sawyer', 6, '1876-06-01', 'Aventura', 274, 'As travessuras de um jovem garoto.', 1),
('Meio Sol Amarelo', 7, '2006-07-12', 'Ficção', 448, 'A história de uma jovem na Nigéria.', 3),
('O Velho e o Mar', 8, '1952-09-01', 'Ficção', 127, 'A luta de um velho pescador.', 2),
('E O Vento Levou', 9, '1936-06-30', 'Romance', 1037, 'Uma história épica da Guerra Civil.', 1),
('Crime e Castigo', 10, '1866-01-01', 'Ficção', 430, 'Um estudo sobre moral e culpa.', 3),
('O Morro dos Ventos Uivantes', 11, '1847-12-01', 'Romance', 416, 'A paixão turbulenta de Heathcliff.', 1),
('1984', 12, '1949-06-08', 'Distopia', 328, 'Uma crítica ao totalitarismo.', 2),
('A Metamorfose', 13, '1915-10-01', 'Ficção', 128, 'A transformação de um homem em inseto.', 3),
('A sombra do vento', 14, '2001-04-17', 'Ficção', 487, 'Mistério em uma biblioteca secreta.', 1),
('Dom Casmurro', 15, '1899-01-01', 'Ficção', 304, 'A história de Bentinho e Capitu.', 2),
('A Revolução dos Bichos', 16, '1945-08-17', 'Fábula', 112, 'Uma sátira ao totalitarismo.', 3),
('A Insustentável Leveza do Ser', 17, '1984-02-02', 'Ficção', 368, 'Amor e filosofia na Praga de 1968.', 1),
('O Pequeno Príncipe', 18, '1943-04-06', 'Ficção', 96, 'Um conto filosófico sobre a infância.', 2),
('O Conde de Monte Cristo', 19, '1844-08-28', 'Aventura', 1276, 'A vingança de Edmond Dantès.', 3),
('Fahrenheit 451', 20, '1953-10-19', 'Ficção científica', 158, 'Uma sociedade que queima livros.', 1),
('Os Miseráveis', 21, '1862-01-01', 'Ficção', 1463, 'A luta de Jean Valjean pela redenção.', 2),
('O Silêncio dos Inocentes', 22, '1988-08-01', 'Thriller', 368, 'Uma caçada a um serial killer.', 3),
('O Senhor dos Anéis: A Sociedade do Anel', 23, '1954-07-29', 'Fantasia', 423, 'A jornada de Frodo pela Terra Média.', 1),
('O Guia do Mochileiro das Galáxias', 24, '1979-10-12', 'Ficção científica', 224, 'Uma viagem hilariante pelo universo.', 2),
('O Tempo e o Vento', 25, '1949-01-01', 'Ficção', 880, 'A história do Rio Grande do Sul.', 1),
('A Mão e a Luva', 27, '1874-01-01', 'Romance', 272, 'Um romance sobre amor e ambição.', 2),
('Memórias Póstumas de Brás Cubas', 28, '1881-01-01', 'Ficção', 384, 'Um defunto narra sua história.', 3),
('O Alienista', 29, '1882-01-01', 'Ficção', 144, 'Um médico que busca entender a loucura.', 1),
('O Apanhador no Campo de Centeio', 30, '1951-07-16', 'Ficção', 277, 'A jornada de Holden Caulfield.', 2),
('A Casa dos Espíritos', 31, '1982-05-01', 'Ficção', 368, 'A história de uma família chilena.', 1),
('Moby Dick', 32, '1851-10-18', 'Aventura', 635, 'A busca por uma baleia branca.', 2),
('O Estrangeiro', 33, '1942-05-01', 'Ficção', 123, 'A vida de um homem indiferente.', 3),
('A Cor Púrpura', 34, '1982-06-01', 'Ficção', 295, 'A luta de uma mulher afro-americana.', 1),
('O Sol é para Todos', 35, '1960-07-11', 'Ficção', 324, 'Uma reflexão sobre a justiça e moralidade.', 2),
('O Livro dos Espíritos', 36, '1857-04-18', 'Espiritualidade', 392, 'Fundamentos do espiritismo.', 3),
('O Último dos Moicanos', 37, '1826-02-01', 'Aventura', 500, 'A história de nativos americanos.', 1),
('O Lobo da Estepe', 38, '1927-01-01', 'Ficção', 237, 'A luta interna de um homem dividido.', 2),
('As Crônicas de Nárnia: O Leão, a Feiticeira e o Guarda-Roupa', 39, '1950-10-16', 'Fantasia', 206, 'A aventura em um mundo mágico.', 3),
('O Diário de Anne Frank', 40, '1947-06-25', 'Não-ficção', 283, 'A vida de uma jovem judia durante a guerra.', 1),
('O Lobo do Mar', 41, '1904-01-01', 'Aventura', 276, 'A história de um homem no mar.', 2);


INSERT INTO users (user_id, fullname, email, phone_number, user_address)
VALUES
(1, 'João Silva', 'joao.silva@example.com', '1234567890', 'Rua A, 123'),
(2, 'Maria Oliveira', 'maria.oliveira@example.com', '2345678901', 'Rua B, 456'),
(3, 'Pedro Santos', 'pedro.santos@example.com', '3456789012', 'Rua C, 789'),
(4, 'Ana Costa', 'ana.costa@example.com', '4567890123', 'Rua D, 101'),
(5, 'Lucas Pereira', 'lucas.pereira@example.com', '5678901234', 'Rua E, 202'),
(6, 'Fernanda Lima', 'fernanda.lima@example.com', '6789012345', 'Rua F, 303'),
(7, 'Juliana Rocha', 'juliana.rocha@example.com', '7890123456', 'Rua G, 404'),
(8, 'Rafael Almeida', 'rafael.almeida@example.com', '8901234567', 'Rua H, 505'),
(9, 'Larissa Martins', 'larissa.martins@example.com', '9012345678', 'Rua I, 606'),
(10, 'Carlos Souza', 'carlos.souza@example.com', '0123456789', 'Rua J, 707'),
(11, 'Roberto Gomes', 'roberto.gomes@example.com', '1123456789', 'Rua K, 808'),
(12, 'Patrícia Silva', 'patricia.silva@example.com', '2234567890', 'Rua L, 909'),
(13, 'Thiago Lima', 'thiago.lima@example.com', '3345678901', 'Rua M, 100'),
(14, 'Camila Dias', 'camila.dias@example.com', '4456789012', 'Rua N, 200'),
(15, 'André Mendes', 'andre.mendes@example.com', '5567890123', 'Rua O, 300'),
(16, 'Julio Freitas', 'julio.freitas@example.com', '6678901234', 'Rua P, 400'),
(17, 'Clara Rocha', 'clara.rocha@example.com', '7789012345', 'Rua Q, 500'),
(18, 'Eduardo Alves', 'eduardo.alves@example.com', '8890123456', 'Rua R, 600'),
(19, 'Sofia Martins', 'sofia.martins@example.com', '9901234567', 'Rua S, 700'),
(20, 'Marcelo Ribeiro', 'marcelo.ribeiro@example.com', '1012345678', 'Rua T, 800'),
(21, 'Isabela Ferreira', 'isabela.ferreira@example.com', '1123456780', 'Rua U, 900'),
(22, 'Leandro Costa', 'leandro.costa@example.com', '2234567891', 'Rua V, 1010'),
(23, 'Tatiane Lopes', 'tatiane.lopes@example.com', '3345678902', 'Rua W, 1110'),
(24, 'Fabio Cardoso', 'fabio.cardoso@example.com', '4456789013', 'Rua X, 1210'),
(25, 'Mariana Nascimento', 'mariana.nascimento@example.com', '5567890124', 'Rua Y, 1310'),
(26, 'Gustavo Santos', 'gustavo.santos@example.com', '6678901235', 'Rua Z, 1410'),
(27, 'Priscila Almeida', 'priscila.almeida@example.com', '7789012346', 'Rua AA, 1510'),
(28, 'Ricardo Martins', 'ricardo.martins@example.com', '8890123457', 'Rua AB, 1610'),
(29, 'Tatiane Ribeiro', 'tatiane.ribeiro@example.com', '9901234568', 'Rua AC, 1710'),
(30, 'Danilo Pires', 'danilo.pires@example.com', '1012345679', 'Rua AD, 1810');

INSERT INTO loans (loan_id, book_id, user_id, loan_date, return_date) 
VALUES 
(1, 429, 1, '2024-01-15', '2024-02-15'), 
(2, 469, 2, '2024-01-20', '2024-02-20'), 
(3, 509, 3, '2024-01-25', '2024-02-25'), 
(4, 549, 4, '2024-02-01', '2024-03-01'), 
(5, 430, 5, '2024-02-10', '2024-03-10'), 
(6, 470, 6, '2024-02-15', '2024-03-15'), 
(7, 510, 7, '2024-02-20', '2024-03-20'), 
(8, 550, 8, '2024-03-01', '2024-04-01'), 
(9, 431, 9, '2024-03-05', '2024-04-05'), 
(10, 471, 10, '2024-03-10', '2024-04-10'), 
(11, 511, 11, '2024-03-15', '2024-04-15'), 
(12, 551, 12, '2024-03-20', '2024-04-20'), 
(13, 432, 13, '2024-03-25', '2024-04-25'), 
(14, 472, 14, '2024-04-01', '2024-05-01'), 
(15, 512, 15, '2024-04-05', '2024-05-05'), 
(16, 552, 16, '2024-04-10', '2024-05-10'), 
(17, 433, 17, '2024-04-15', '2024-05-15'), 
(18, 473, 18, '2024-04-20', '2024-05-20'), 
(19, 513, 19, '2024-04-25', '2024-05-25'), 
(20, 553, 20, '2024-05-01', '2024-06-01');


SELECT book_id from books;
SELECT COUNT(*) from users;

INSERT INTO users (full_name, email, phone_number, address) 
VALUES 
('Alice Johnson', 'alice.johnson@example.com', '123-456-7890', '123 Elm St, Springfield, IL'),
('Bob Smith', 'bob.smith@example.com', '234-567-8901', '234 Maple Ave, Shelbyville, IL'),
('Charlie Brown', 'charlie.brown@example.com', '345-678-9012', '345 Oak Dr, Capital City, IL'),
('Diana Prince', 'diana.prince@example.com', '456-789-0123', '456 Pine Ln, Gotham, NY'),
('Ethan Hunt', 'ethan.hunt@example.com', '567-890-1234', '567 Cedar Blvd, Metropolis, NY'),
('Fiona Green', 'fiona.green@example.com', '678-901-2345', '678 Birch St, Star City, CA'),
('George Clark', 'george.clark@example.com', '789-012-3456', '789 Cherry Ct, Central City, CA'),
('Hannah White', 'hannah.white@example.com', '890-123-4567', '890 Willow Way, Smallville, KS'),
('Ian Black', 'ian.black@example.com', '901-234-5678', '901 Spruce Dr, Coast City, CA'),
('Julia Red', 'julia.red@example.com', '012-345-6789', '12 Poplar Ln, Bay City, TX'),
('Kevin Blue', 'kevin.blue@example.com', '123-456-7891', '123 Walnut St, Starling City, CA'),
('Laura Gray', 'laura.gray@example.com', '234-567-8902', '234 Chestnut Blvd, Fawcett City, IL'),
('Michael Brown', 'michael.brown@example.com', '345-678-9013', '345 Ash Dr, Gotham, NY'),
('Nina Blue', 'nina.blue@example.com', '456-789-0124', '456 Redwood Rd, Metropolis, NY'),
('Oscar Green', 'oscar.green@example.com', '567-890-1235', '567 Fir Ct, Smallville, KS'),
('Paula White', 'paula.white@example.com', '678-901-2346', '678 Cypress St, Capital City, IL'),
('Quinn Red', 'quinn.red@example.com', '789-012-3457', '789 Maple Dr, Coast City, CA'),
('Ryan Black', 'ryan.black@example.com', '890-123-4568', '890 Elm St, Star City, CA'),
('Sophie Gray', 'sophie.gray@example.com', '901-234-5679', '901 Pine Ave, Central City, CA'),
('Tommy Yellow', 'tommy.yellow@example.com', '012-345-6780', '12 Birch Ln, Shelbyville, IL');

SELECT u.full_name, COUNT(l.loan_id) AS total_loans
FROM users u
LEFT JOIN loans l ON u.user_id = l.user_id
GROUP BY u.user_id;

SELECT b.book_title, COUNT(l.loan_id) AS times_loaned
FROM books b
LEFT JOIN loans l ON b.book_id = l.book_id
GROUP BY b.book_id
ORDER BY times_loaned DESC;

SELECT u.full_name, u.phone_number 
FROM users u
LEFT JOIN loans l ON u.user_id = l.user_id
GROUP BY u.user_id
ORDER BY u.phone_number DESC;

SELECT 
    u.user_id,
    u.full_name,
    COUNT(l.loan_id) AS total_loans,
    GROUP_CONCAT(CONCAT(l.loan_date, ' (', l.return_date, ')')
    ORDER BY l.loan_date ASC SEPARATOR ', ') 
	AS loan_details
FROM 
    users u
LEFT JOIN 
    loans l ON u.user_id = l.user_id
GROUP BY 
    u.user_id, u.full_name
ORDER BY 
    total_loans DESC;


SELECT 
    ll.street_name,
    ll.city_name,
    ll.country_name,
    u.full_name,
    u.phone_number,
    u.address,
    CASE
        WHEN ll.street_name <> u.address THEN 'Necessary to calculate the distance for delivery.'
        ELSE 'Not necessary calculation'
    END AS Distance_calculation
FROM 
    library_location ll
LEFT JOIN 
    users u ON ll.city_name = u.address  -- Ajuste a condição de join conforme sua lógica
ORDER BY 
    ll.city_name, u.full_name;

SELECT 
    ll.street_name,
    ll.city_name,
    ll.country_name,
    COALESCE(u.full_name, 'Unknown User') AS full_name,
    COALESCE(u.phone_number, 'No Phone Number') AS phone_number,
    COALESCE(u.address, 'No Address') AS address,
    CASE
        WHEN ll.street_name <> COALESCE(u.address, '') THEN 'Necessary to calculate the distance for delivery.'
        ELSE 'Not necessary calculation'
    END AS Distance_calculation
FROM 
    library_location ll
LEFT JOIN 
    users u ON ll.city_name = u.address
ORDER BY 
    ll.city_name, full_name;










