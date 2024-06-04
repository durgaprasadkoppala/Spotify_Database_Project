QUERIES:

1) Who are all having spotify premium accounts ? 
select Username, Subscription_Type, Gender  
from SP_User  
where Plan_ID in ('1','2','3','4')  
order by Subscription_Type 

2) Customers who are targeted by business commercials 
select* from SP_User where Ad_ID in 
(select Ad_ID from SP_UserAdvertisement where Ad_ID in 
(select Ad_ID 
from SP_Advertisements where Type='Insurance')) 
 
3) Display Drake's albums.  
select Artist_Name, Album_Title, Release_Date, Total_Tracks 
from SP_Albums SA, SP_ArtistAlbum SAA, SP_Artists SAAA 
where SA.Artist_ID=SAA.Artist_ID and SAA.Artist_ID=SAAA.Artist_ID and Artist_Name='Drake' 
 
4) Show all SPOTIFY  featured playlist 
 select Playlist_Name from SP_Featured_Playlist where playlist_ID in  
(select Playlist_ID from SP_Playlist where USER_ID in  
(select USER_ID from SP_User_Library)) 
 


5) What are the top rated songs in spotify? 
select Genre_Name,Track_Title,Description, Popularity_Rating 
from SP_Genre SG, SP_Tracks ST 
where SG.Genre_ID=ST.Genre_ID and Popularity_Rating>='8' 
order by Popularity_Rating desc 
 
6) Find the number of tracks in an album id 1100 
SELECT t.Track_Title 
FROM SP_Albums a  
JOIN SP_Tracks t ON a.Album_ID = t.Album_ID  
where t.Album_ID='1100' 
 
7) Display which album have the genre type R&B  
SELECT DISTINCT a.Album_ID, a.Album_Title  
FROM SP_Albums a  
JOIN SP_Tracks t ON a.Album_ID = t.Album_ID  
JOIN SP_Genre g ON t.Genre_ID = g.Genre_ID  
WHERE g.Genre_Name = 'R&B'; 
 
8) Dispaly the total number of playlists created by each user  
SELECT SP_user.username, COUNT(SP_Playlist.Playlist_ID) AS Total_Playlists  
FROM SP_user  
LEFT JOIN SP_Playlist ON SP_user.user_id = SP_Playlist.User_ID  
GROUP BY SP_user.username 
 


9) Display users who have followed more than 5 artists.  
SELECT SP_user.username, COUNT(SP_Followed_Artists.Artist_ID) AS Total_Followed  
FROM SP_user  
LEFT JOIN SP_Followed_Artists ON SP_user.user_id = SP_Followed_Artists.User_ID  
GROUP BY SP_user.username  
HAVING COUNT(SP_Followed_Artists.Artist_ID) >= 1 
 
10) Display users who have subscribed to the 'Duo' plan and what features does they get 
SELECT Username, Features  
FROM SP_user s , SP_Subscription_Plans p 
WHERE s.Subscription_Type=s.Subscription_Type and p.Subscription_Type='Duo' 
 
11) List all tracks with a popularity rating greater than 8 and its geners  
SELECT Track_Title, Popularity_Rating  
FROM SP_Tracks t, SP_Genre g 
WHERE t.Genre_ID=g.Genre_ID and  Popularity_Rating > 8 
 
12) Count the number of tracks in each genre:  
 SELECT Genre_Name, COUNT(Track_ID) AS track_count   
FROM SP_Tracks t, SP_Genre g 
where t.Genre_ID=g.Genre_ID 
GROUP BY Genre_Name 
 
13) Display the names of all artists and the titles of their albums.  
SELECT A.Artist_Name, AL.Album_Title   
FROM SP_Artists A,SP_ArtistAlbum AA ,SP_Albums Al  
where A.Artist_ID=AA.Artist_ID AND AA.Album_ID=Al.Album_ID; 
 
14) Display the names of all artists followed by the user with the ID '800'.  
SELECT Artist_Name   
FROM SP_Artists   
WHERE Artist_ID IN (  
SELECT Artist_ID  
FROM SP_Followed_Artists   
WHERE Followed_Artist_ID = 800); 
 
15) Display username, email, and phone number of users who have a student subscription plan  
SELECT u.Username, u.Email, u.PhoneNumber  
FROM SP_User u  
JOIN SP_Subscription_Plans s ON u.Plan_ID = s.Plan_ID  
WHERE s.Subscription_Type = 'Student'; 
 
 16) Display which ad targeted which user  
SELECT U.Username, A.Advertiser 
FROM  SP_User U,  SP_UserAdvertisement UA, SP_Advertisements A  
where UA.User_ID = U.User_ID and  UA.Ad_ID = A.Ad_ID; 

17) User gender and subscription plan  
SELECT  U.Gender, S.Subscription_Type  
FROM SP_User U  
JOIN SP_Subscription_Plans S ON U.Plan_ID = s.Plan_ID 
order by Gender 
 
18) Display all the user playlist in the library along with the created date.  
Select Playlist_Name, Colloborators,Creation_Date 
from SP_User_Library A, SP_Playlist B 
where A.Playlist_ID=B.Playlist_ID 
 
19) List all the songs of user '100' from user history 
select Username, Name_of_Song 
from SP_User s, SP_Listening_History h 
where s.User_ID = h.User_ID and s.User_ID='100' 
 
20) Display all users who have not added any tracks to their library. 
SELECT u.username 
FROM SP_user u 
LEFT JOIN SP_User_Library ul ON u.user_id = ul.User_ID 
WHERE ul.Library_ID IS NULL 
