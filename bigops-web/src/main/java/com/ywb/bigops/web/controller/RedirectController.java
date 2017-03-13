package com.ywb.bigops.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * RedirectController
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/13
 */
@Controller
public class RedirectController extends BaseController {

    @RequestMapping("/gotoPage")
    public ModelAndView gotoPage(String path) {
        System.out.println("gotoPage -> " + path);
        return new ModelAndView(path);
    }
}
