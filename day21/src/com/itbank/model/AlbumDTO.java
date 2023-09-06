package com.itbank.model;

import java.sql.Date;

/*
  id          number          default album_seq.nextval primary key,
    artist_id   number          not null,
    name        varchar2(200)   not null,
    type        varchar2(100)   not null,
    rDate       date            not null,
    playTime    number          not null,
    coverImg    varchar2(500),
 */

public class AlbumDTO {
	private int id;
	private String artist_id;
	private String name;
	private String type;

	private Date rdate;
	private int playtime;
	private String coverimg;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getArtist_id() {
		return artist_id;
	}
	public void setArtist_id(String artist_id) {
		this.artist_id = artist_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public int getPlaytime() {
		return playtime;
	}
	public void setPlaytime(int playtime) {
		this.playtime = playtime;
	}
	public String getCoverimg() {
		return coverimg;
	}
	public void setCoverimg(String coverimg) {
		this.coverimg = coverimg;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	

}
