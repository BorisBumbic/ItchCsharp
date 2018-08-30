
--Select * from Artist 

--order by Name asc

--Select Top 10 * from Artist
--order by ArtistId 

/*
4)
Lista de 10 f�rsta artisterna, sorterat p� namn. (ArtistId, Name)
Select Top 10 * from Artist 

5)
Lista alla artister som b�rjar p� "Academy" (Name)
*/
--Select * from Artist
--where Name like 'academy%'
--6)
--Lista alla album d�r den andra bokstaven i titeln �r �a� och den tredje bokstaven �r �r� (Title)

--Select * from Album
--where Title like '_ar%'

--7)
--Lista alla album d�r f�rsta bokstaven p� titeln �r en vokal

--Select * from Album
--where Title like '[aeiouy]%'

--8)
--Lista alla album tillsammans med artister f�r albumen (ArtistName, AlbumTitle)
--Select * from AlbumTitle and ArtistName

--Select * from Artist
-- join Album on Artist.ArtistId = Album.ArtistId

--9)
--F�rklara skillnaden mellan

--inner join - (INNER) JOIN: Returns records that have matching values in both tables
--left join - Return all records from the left table, and the matched records from the right table
--right join -   Return all records from the right table, and the matched records from the left table
--full join - Return all records when there is a match in either left or right table

--10)
--Lista de 10 artister som sl�ppt flest album (NrOfAlbums, ArtistName)

--Select Top 10 Name,Count(*) as AlbumAntal
--from Artist
--join Album on Artist.ArtistId = Album.ArtistId
--Group by Artist.Name
--order by AlbumAntal desc

--11)
--Lista namn p� alla album som �r Jazz eller Blues. Ett album ska bara finnas i listan en g�ng. (AlbumTitle)

--Select distinct Album.Title, Genre.Name from Album
--join Track on Album.AlbumId = Track.AlbumId
--join Genre on Track.GenreId = Genre.GenreId
--where Genre.Name = 'Jazz' or Genre.Name = 'Blues'
--order by Genre.Name, Album.Title

--SAMMA KOD IGEN:

--Select distinct Album.Title, Genre.Name  from Album
--join Track on Album.AlbumId = Track.AlbumId
--join Genre on Track.GenreId = Genre.GenreId
--where Genre.Name = 'Jazz' or Genre.Name = 'Blues'
--Order by Genre.NAme, Album.Title

--12)
--Albumet "Let There Be Rock" (av AC/DC) inneh�ller 8 l�tar. Modifiera databasen s� det g�r att ordna l�tar i nummerordning.
--Uppdatera sedan databasen s� l�tarna i "Let There Be Rock" �r numrerade fr�n 1 till 8.


--Select  * from Track
--where Track.AlbumId= 4
--Alter Table Track Add TrackNumber int 
--Update Track Set TrackNumber = 1 where TrackID = 15
--Update Track Set TrackNumber = 2 where TrackID = 16
--Update Track Set TrackNumber = 3 where TrackID = 17
--Update Track Set TrackNumber = 4 where TrackID = 18
--Update Track Set TrackNumber = 5 where TrackID = 19
--Update Track Set TrackNumber = 6 where TrackID = 20
--Update Track Set TrackNumber = 7 where TrackID = 21
--Update Track Set TrackNumber = 8 where TrackID = 22

--13)
--Skriv en sqlfr�ga som visar de genres som �r mest popul�ra.

--Lista genre och antal tracks i den genren. Visa den genre som har flest tracks f�rst och sedan i ned�tstigande ordning.
--Visa endast de genres som har fler �n 100 tracks. (GenreName, NrOfTracks)

--select Genre.Name,  Count(*) as NrOfTracks from Genre
--Join Track on Genre.GenreId = Track.GenreId
--Group by Genre.Name
--Having Count(*) >= 100
--order by NrOfTracks desc

--select * from track
--select * from Genre

--OSKARS L�SNING: 

--select genre.Name, Count(*) as AntalTracks
--from genre join track on genre.GenreId = Track.GenreId
--group by genre.NAme
--having Count(*) > 100
--order by AntalTracks desc

--14)
--declare @getCustomerId int = (

--select CustomerId
--select * From customer
--join Invoice on Customer.CustomerId = Invoice.CustomerId
--Where FirstName = 'Leonie' AND LastName = 'K�hler'



--Select InvoiceDate
--From Invoice
--Where CustomerId = @getCustomerId
--14)

--declare @getCustomerId int = ( 
--select CustomerId
--From customer
--Where FirstName = 'Leonie' AND LastName = 'K�hler')



--Select InvoiceDate
--From Invoice
--Where CustomerId = @getCustomerId

--15)
--Skapa en tempor�r tabell #CustomerWithSupport som inneh�ller 
--f�rnamn och efternamn p� en kund och dess supportpersonal 
--(CustomerFirstName, CustomerLastName, SupportFirstName, SupportLastName)

--CREATE TABLE #CustomerWithSUpport (
--CustomerId int, 
--CustomerFirstName varchar(50), 
--CustomerLastName varchar (50), 
--SupportFirstName varchar(50), 
--SupportLastName varchar(50)
--)
--select * from #CustomerWithSUpport

--CREATE TABLE CWS as
--Select CustomerId, FirstName, LastName
--FROM Customer
--where 

--INSERT into #CustomerWithSUpport
--Select CustomerId, Customer.FirstName,Customer.LastName,Employee.FirstName as SupportFirstName, Employee.LastName as SupportLastName
--From Customer
--Join Employee on Customer.SupportRepId = Employee.EmployeeId

--Order by Employee.LastName



--16)
--Lista alla anst�llda som har en chef och deras chef.

--Resultatet ska vara tv� kolumner (ej 4) med den anst�lldes och chefens fullst�ndiga namn

--(EmployeeName, BossName)

--Select EMP.FirstName + ' ' + EMP.LastName as Employee, CHEF.FirstName + ' ' + CHEF.LastName as Boss from Employee as EMP
--join Employee as CHEF on EMP.ReportsTo = CHEF.EmployeeId

--17)
--Ta reda p� hur m�nga tecken den l�ngsta epostadressen har bland alla kunder (LongestMail)
--Select MAX(Email.Length) as LongestEmail
--from Customer

--DEtta �r r�tt:
--Select Top 1 LEN(Customer.Email) as Characters, Customer.Email from Customer
--Order by Characters desc

--18)
--Ta reda p� den eller de l�tar som p�g�r l�ngst tid Resultatet ska vara en rad med l�ttitel och l�ngden p� l�ten (Name, Minutes)

--DEtta �r r�tt:
--Select Name, Milliseconds/60000 as Minutes, MediaTypeId 
--from Track
--where Track.MediaTypeId != 3
--Order by Milliseconds desc


--Select * from Track
--join MediaType on Track.MediaTypeId = MediaType.MediaTypeId

--Select * from MediaType

--19)
--Select FirstName, LastName, Email
--from Customer
--order by Email

--ALTER TABLE Customer
--ADD UNIQUE (Email)

--insert into Customer (FirstName, LastName, Email) values ('Lisa', 'Nilsson', 'aaa@aaa.se')
--delete from Customer where Email= 'aaa@aaa.se'


--20)
--Lista hur mycket som har fakturerat f�r varje �r (2009-2013). Sortera s� senaste �ren visas f�rst (2013) (Year, Sum)

--Select Year(InvoiceDate) as [Year], Sum(Total) as Revenue from Invoice
--group by Year(InvoiceDate) 
--Order by Year desc

--21)
--Ta fram l�ngsta spellistan. (Name, TotalLengthInHours)

--Select PlayList.Name,  sum(Milliseconds/60000.0/60.0) as Hours

--from Track 
--join PlaylistTrack on PlaylistTrack.TrackId = Track.TrackId
--join Playlist on PlayList.PlaylistId = PlaylistTrack.PlaylistId


--group by PlayList.Name
--Order by Hours desc

--SELECT PlayList.Name as Name, SUM(track.Milliseconds)/(1000*60*60) AS TotalLengthInHours
--FROM ((PlayListTrack
--INNER JOIN Playlist ON PlaylistTrack.PlaylistId=PlayList.PlaylistId)
--INNER JOIN Track ON Track.TrackId=PlaylistTrack.TrackId)
--GROUP BY Playlist.Name
--ORDER BY TotalLengthInHours DESC


--Select * from Artist
-- join Album on Artist.ArtistId = Album.ArtistId

--Select Sum(Total) from Invoice



--23)
--L�gg till en tabell Review kopplad till Album

--L�gg sedan till en review p� albumet "Black Sabbath" (mha insert into...)

--OSKAR GENOMG�NG UPPGIFT 23
--create Table Review (

--ReviewId int, 
--ReviewText varchar (1000), 
--AlbumId int, 


--)

--declare @albumId int = (Select * from Album where Title = 'Black Sabbath')

--insert into Review ( ReviewId, ReviewText, AlbumId)
--values (1, 'Bla bla', @albumId)





