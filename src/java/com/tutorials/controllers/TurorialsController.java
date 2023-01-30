/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
 */
package com.tutorials.controllers;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tutorials.beans.TutorialsBean;
import com.tutorials.dao.TutorialsDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Christian Cornejo
 */
@Controller
public class TurorialsController {

  @Autowired
  TutorialsDao tutorialsDao;

  @RequestMapping("/Homepage")
  public ModelAndView homepage() {
    ModelAndView mav = new ModelAndView("Homepage");

    TutorialsBean sampleBean = new TutorialsBean();
//    sampleBean.setId(1);
//    sampleBean.setDesc("Sample text from Bean");
//    sampleBean.setFlag_active(true);

    mav.addObject("command", sampleBean);
//mav.addObject("command", new TutorialsBean());
    return mav;
  }
/////////////////////////////////////////////

  @RequestMapping("/Viewmovie")
  public ModelAndView viewmovie(TutorialsBean bean) {
    ModelAndView mav = new ModelAndView("Viewmovie");
    List<TutorialsBean> list = tutorialsDao.getAllMovies();

    mav.addObject("list", list);
    mav.addObject("command", bean);

    return mav;
  }
////////////////////////////////////////////////

  @RequestMapping("/Addmovie")
  public ModelAndView addmovie(TutorialsBean tutorialsBean) {
    ModelAndView mav = new ModelAndView("Addmovie");
    //command-keyword
    mav.addObject("command", tutorialsBean);
    return mav;
  }

  @RequestMapping("/Addmovie/save")
  public ModelAndView addmoviesave(TutorialsBean tutorialsBean, HttpServletRequest request) {

    ModelAndView mav = new ModelAndView("Addmovie");
    System.out.println(">>>>>>>>>>>>>ADD MOVIE: ");

    System.out.println("title: " + tutorialsBean.getMovie_title());
    System.out.println("genre: " + tutorialsBean.getGenre());
    System.out.println("release_date: " + tutorialsBean.getRelease_date());
    tutorialsDao.saveData(tutorialsBean);
    mav.addObject("command", tutorialsBean);
    return new ModelAndView("redirect:/Viewmovie");
  }

  @RequestMapping("/Searchmovie")
  public ModelAndView searchmovie(TutorialsBean tutorialsBean) {
    ModelAndView mav = new ModelAndView("Searchmovie");
    mav.addObject("command", tutorialsBean);
    return mav;
  }
////////////////////////////////////////////////

  @RequestMapping("/Deletemovie/{id}")
  public ModelAndView deleterowmovie(@PathVariable("id") int id, TutorialsBean tutorialsBean, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView("Viewmovie");
//    int id = Integer.parseInt(request.getParameter("id"));
//    System.out.println(">>>>>>>>>>>.id : " + id);
//    System.out.println(">>>>>>>>>>>.bean id : " + id);
    tutorialsDao.deleteData(id);
    mav.addObject("command", tutorialsBean);
    return new ModelAndView("redirect:/Viewmovie");
  }

  @RequestMapping("/Updatemovie")
  public ModelAndView updaterowmovie(TutorialsBean tutorialsBean, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView("Updatemovie");
//    int id = Integer.parseInt(request.getParameter("id"));
//    System.out.println(">>>>>>>>>>>.id : " + id);
    System.out.println(">>>>>>>>>>>.bean id : " + tutorialsBean.getId());
    System.out.println("id : " + tutorialsBean.getId());
    System.out.println("movie title : " + tutorialsBean.getMovie_title());
    System.out.println("genre : " + tutorialsBean.getGenre());
    System.out.println("release date : " + tutorialsBean.getRelease_date());
    tutorialsDao.updateData(tutorialsBean.getId(), tutorialsBean.getMovie_title(), tutorialsBean.getGenre(), tutorialsBean.getRelease_date());
//    tutorialsDao.deleteData(id);
    mav.addObject("command", tutorialsBean);
    return new ModelAndView("redirect:/Viewmovie");
  }

  @RequestMapping(value = "/linkDescList", method = RequestMethod.POST)
  public ModelAndView showlinkDescList(TutorialsBean tutorialsBean, HttpServletRequest req, HttpServletResponse response) {
//no need dahil may bean
//    String movie_title = req.getParameter("title");
//    String release_date = req.getParameter("release_date");

//    TutorialsBean sampleBean = new TutorialsBean();
//    sampleBean.setMovie_title("");
//    sampleBean.setRelease_date("");


//    System.out.println("movie_title " + movie_title);
//    System.out.println("release_date " + release_date);
    List<TutorialsBean> list = tutorialsDao.list(tutorialsBean);

    for (int i = 0; i < list.size(); i++) {
      System.out.println("TITLE " + list.get(i).getMovie_title());
    }

    ModelAndView mav = new ModelAndView("Searchmovie");
    mav.addObject("list", list);
    mav.addObject("command", tutorialsBean);
    return mav;

  }
}
