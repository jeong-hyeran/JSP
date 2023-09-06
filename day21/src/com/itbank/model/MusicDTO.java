package com.itbank.model;
/*
     id          number          default music_seq.nextval primary key,
    artist_id   number          not null,
    album_id    number          not null,
    name        varchar2(200)   not null,
    genre       varchar2(100)   not null,
    playtime    number          not null,
    lyrics      clob            ,
    playCount   number          default 0,
 */

public class MusicDTO {

	private int id;
	private int artist_id;
	private int album_id;
	private String name;
	private String genre;
	private int playtime;
	private String lyrics;
	private int playCount;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getArtist_id() {
		return artist_id;
	}
	public void setArtist_id(int artist_id) {
		this.artist_id = artist_id;
	}
	public int getAlbum_id() {
		return album_id;
	}
	public void setAlbum_id(int album_id) {
		this.album_id = album_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getPlaytime() {
		return playtime;
	}
	public void setPlaytime(int playtime) {
		this.playtime = playtime;
	}
	public String getLyrics() {
		return lyrics;
	}
	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}
	public int getPlayCount() {
		return playCount;
	}
	public void setPlayCount(int playCount) {
		this.playCount = playCount;
	}


}
