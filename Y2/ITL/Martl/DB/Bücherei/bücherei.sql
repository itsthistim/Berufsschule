-- a) Kategorien im Bereich Belletristik
select genreName from genre
	natural join category
    where genreID = 2;
    
-- b) Hauptkategorie eines bestimmten Buches
select categoryName as "Hauptkategorie" from category
	inner join genre on category.categoryID = genre.categoryID
	inner join book_has_genre on genre.genreID = book_has_genre.genreID
	inner join book on book_has_genre.bookID = book.bookID
	where book.bookID = 1;

-- c) Welche Bücher werden nach Kategorie am meisten ausgeliehen?
select * from book_has_genre;
select * from category;
select * from book;

select * from category
inner join genre on category.categoryID = genre.categoryID
inner join book_has_genre on book_has_genre.genreID = genre.genreID
inner join book on book.bookID = book_has_genre.bookID;

-- d) Verfügbare Zeitschriften?
select newspaperName as "Verfügbare Zeitungen" from newspaper
where customer_customerID IS NULL;

-- e) Wie lange wurde ein bestimmtes Buch geliehen?
select book.bookID as "BuchID", book.bookTitle as "Buchtitel", datediff(cost.borrowedEndDate,cost.borrowedStartDate) as "Leihdauer (in Tage)" from book
inner join cost on cost.costID = book.costID
where book.bookID = 2;

-- f) Name des Autors eines bestimmten Buches
select book.bookID as "BuchID", book.bookTitle as "Buchtitel", author.authorName as "Autor" from author
natural join author_wrote_book
natural join book
where book.bookID = 2;