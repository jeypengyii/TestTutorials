/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tutorials.beans;

/**
 *
 * @author Christian
 */
public class TutorialsBean {

  /**
   * @return the title
   */
  public String getTitle() {
    return title;
  }

  /**
   * @param title the title to set
   */
  public void setTitle(String title) {
    this.title = title;
  }

  /**
   * @return the movie_title
   */
  public String getMovie_title() {
    return movie_title;
  }

  /**
   * @param movie_title the movie_title to set
   */
  public void setMovie_title(String movie_title) {
    this.movie_title = movie_title;
  }

  /**
   * @return the release_date
   */
  public String getRelease_date() {
    return release_date;
  }

  /**
   * @param release_date the release_date to set
   */
  public void setRelease_date(String release_date) {
    this.release_date = release_date;
  }

  /**
   * @return the genre
   */
  public String getGenre() {
    return genre;
  }

  /**
   * @param genre the genre to set
   */
  public void setGenre(String genre) {
    this.genre = genre;
  }

  /**
   * @return the id
   */
  public int getId() {
    return id;
  }

  /**
   * @param id the id to set
   */
  public void setId(int id) {
    this.id = id;
  }

  /**
   * @return the desc
   */
  public String getDesc() {
    return desc;
  }

  /**
   * @param desc the desc to set
   */
  public void setDesc(String desc) {
    this.desc = desc;
  }

  /**
   * @return the flag_active
   */
  public boolean getFlag_active() {
    return flag_active;
  }

  /**
   * @param flag_active the flag_active to set
   */
  public void setFlag_active(boolean flag_active) {
    this.flag_active = flag_active;
  }

  private int id;
  private String desc;
  private boolean flag_active;

  private String movie_title;
  private String release_date;
  private String genre;
  private String title;

}
