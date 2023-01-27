package com.tutorials.dao;

import com.tutorials.beans.TutorialsBean;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Christian Cornejo
 */
public class TutorialsDao {

  JdbcTemplate template;

  public void setTemplate(JdbcTemplate template) {
    this.template = template;
  }

  public List<TutorialsBean> getAllMovies() {
    String sql = "select id, genre, movie_title, release_date\n"
            + "from movie_table";
    return template.query(sql, new RowMapper<TutorialsBean>() {

      public TutorialsBean mapRow(ResultSet rs, int row) throws SQLException {
        TutorialsBean bean = new TutorialsBean();
        bean.setId(rs.getInt("id"));
        bean.setGenre(rs.getString("genre"));
        bean.setMovie_title(rs.getString("movie_title"));
        bean.setRelease_date(rs.getString("release_date"));
        return bean;

      }

    });
  }

  public List<TutorialsBean> deleteMovie() {
    String sql = "DELETE FROM movie_table WHERE id = ? ;";
    return template.query(sql, new RowMapper<TutorialsBean>() {

      public TutorialsBean mapRow(ResultSet rs, int row) throws SQLException {
        TutorialsBean bean = new TutorialsBean();
        bean.setId(rs.getInt("id"));
        bean.setGenre(rs.getString("genre"));
        bean.setMovie_title(rs.getString("movie_title"));
        bean.setRelease_date(rs.getString("release_date"));
        return bean;

      }

    });
  }

  public List<TutorialsBean> list(String movie_title, String release_date) {
    String sql = "SELECT id, movie_title, genre, release_date \n"
            + "FROM movie_table  \n"
            + "WHERE \n"
            + " CASE WHEN ? <> '' THEN UPPER(movie_title) = UPPER(?) ELSE 1=1 END\n"
            + "AND CASE WHEN ? <> '' THEN release_date = date(?) ELSE 1=1 END;";
    return template.query(sql, new Object[]{movie_title, movie_title, release_date, release_date}, new RowMapper<TutorialsBean>() {
      public TutorialsBean mapRow(ResultSet rs, int row) throws SQLException {
        TutorialsBean bean = new TutorialsBean();
        bean.setId(rs.getInt("id"));
        bean.setGenre(rs.getString("genre"));
        bean.setMovie_title(rs.getString("movie_title"));
        bean.setRelease_date(rs.getString("release_date"));
        return bean;

      }

    });
  }

//    public int getString(String movie_title, String genre, String release_date) {
//    String sql = "SELECT movie_table WHERE movie_table=?;";
//    return template.queryForObject(sql, new Object[]{id}, Integer.class);
//  }
  public int saveData(TutorialsBean bean) {
    String sql = "INSERT INTO movie_table(movie_title, genre, release_date) VALUES(?, ?, date(?));";
    return template.update(sql, bean.getMovie_title(), bean.getGenre(), bean.getRelease_date());
  }

  public int updateData(int id, String movie_title, String genre, String release_date) {
    String sql = "UPDATE movie_table SET movie_title = ?, genre = ?, release_date = date(?) WHERE id = ?;";
    return template.update(sql, movie_title, genre, release_date, id);
  }

  public int deleteData(int id) {
    String sql = "DELETE FROM movie_table WHERE id = ?;";
    return template.update(sql, id);
  }

  public int getInt(int id) {
    String sql = "SELECT id FROM table WHERE id = ?;";
    return template.queryForObject(sql, new Object[]{id

    }, int.class
    );
  }

  public String getString(int id) {
    String sql = "SELECT desc FROM table WHERE id = ?;";
    return template.queryForObject(sql, new Object[]{id}, String.class
    );
  }

  public boolean getBoolean(int id) {
    String sql = "SELECT flag_active FROM table WHERE id = ?;";
    return template.queryForObject(sql, new Object[]{id

    }, boolean.class
    );
  }

}
