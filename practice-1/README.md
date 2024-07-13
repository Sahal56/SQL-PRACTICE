# SQL-PRACTICE


1. SETUP

## 1.1 Login inrto MySql Via CLI
> Make sure mysql server is running

```sh
$ mysql -u root -p
Enter password: {your-password}
```
> -u : user, -p : use password

## 1.1 creating database and table i.e. schema
```sh
mysql> create database music_company;
Query OK, 1 row affected (0.00 sec)

mysql> use music_company;
Database changed
mysql> create table bands (\
    -> id int not null auto_increment,
    -> name varchar(255) not null,
    -> primary key(id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> create table albums (\
    -> id int not null auto_increment,
    -> name varchar(255) not null,
    -> release_year int,
    -> band_id int not null,
    -> primary key(id),
    -> foreign key(band_id) references bands(id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> create table songs (\
    -> id int not null auto_increment,
    -> name varchar(255) not null,
    -> length float not null,
    -> album_id int not null,
    -> primary key(id),
    -> foreign key(album_id) references albums(id)
    -> );
Query OK, 0 rows affected (0.01 sec)

```

## 1.2 Displaying schema
```sh
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| music_company      |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> show tables;
+-------------------------+
| Tables_in_music_company |
+-------------------------+
| albums                  |
| bands                   |
| songs                   |
+-------------------------+
3 rows in set (0.00 sec)

```

## 1.3 Importing Data
> we will use script data.sql instead of manually adding records one by one
> download or copy music_data.sql


```sh
$ mysql -u root -p music_company < music_data.sql
Enter password: {your-password}
```


# 2 Exercises

# 2.1 Get all names of bands

```sh
mysql> desc bands;
+-------+--------------+------+-----+---------+----------------+
| Field | Type         | Null | Key | Default | Extra          |
+-------+--------------+------+-----+---------+----------------+
| id    | int          | NO   | PRI | NULL    | auto_increment |
| name  | varchar(255) | NO   |     | NULL    |                |
+-------+--------------+------+-----+---------+----------------+
2 rows in set (0.01 sec)

mysql> select name as 'band name' from bands where 1;
+-------------------+
| band name         |
+-------------------+
| Seventh Wonder    |
| Metallica         |
| The Ocean         |
| Within Temptation |
| Death             |
| Van Canto         |
| Dream Theater     |
| Seventh Wonder    |
+-------------------+
8 rows in set (0.00 sec)
```

# 2.2 Get the Oldest Album

```sh
mysql> desc albums;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int          | NO   | PRI | NULL    | auto_increment |
| name         | varchar(255) | NO   |     | NULL    |                |
| release_year | int          | YES  |     | NULL    |                |
| band_id      | int          | NO   | MUL | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> select * from albums\
    -> where release_year is not null
    -> order by release_year
    -> limit 1;
+----+------------------------+--------------+---------+
| id | name                   | release_year | band_id |
+----+------------------------+--------------+---------+
|  5 | ...And Justice for All |         1988 |       2 |
+----+------------------------+--------------+---------+
1 row in set (0.00 sec)

```
# 2.3 Get all Bands that have Albums

```sh
mysql> select distinct(b.name) as 'band name' \
    -> from bands b, albums a 
    -> where b.id = a.band_id ;
+-------------------+
| band name         |
+-------------------+
| Seventh Wonder    |
| Metallica         |
| The Ocean         |
| Within Temptation |
| Death             |
| Van Canto         |
+-------------------+
6 rows in set (0.00 sec)

mysql> -- OR

mysql> select distinct(b.name) as 'band name' \
    -> from bands b 
    -> join albums a on b.id = a.band_id ;
+-------------------+
| band name         |
+-------------------+
| Seventh Wonder    |
| Metallica         |
| The Ocean         |
| Within Temptation |
| Death             |
| Van Canto         |
+-------------------+
6 rows in set (0.01 sec)
```

# 2.4 Get all Bands that have No Albums
```sh
mysql> select \
    ->   a.name as 'Name',
    ->   a.release_year as 'Release Year',
    ->   SUM(s.length) as 'Duration'
    -> FROM albums a
    -> JOIN songs s on a.id = s.album_id
    -> GROUP BY s.album_id
    -> ORDER BY Duration DESC
    -> LIMIT 1;
+----------------+--------------+-------------------+
| Name           | Release Year | Duration          |
+----------------+--------------+-------------------+
| Death Magnetic |         2008 | 74.76666593551636 |
+----------------+--------------+-------------------+
1 row in set (0.01 sec)
```

# 2.5 Get the Longest Album
```sh
```

# 2.6
```sh
```

