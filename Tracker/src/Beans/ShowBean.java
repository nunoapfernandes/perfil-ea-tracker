package Beans;

import Model.Season;
import Model.Show;
import Persistence.ShowDAO;

import javax.ejb.Stateless;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */

@Stateless(name = "ShowEJB")
public class ShowBean implements ShowBeanLocal{
    @Override
    public void save(Show show) {
        ShowDAO.registerShow(show);
    }

    @Override
    public Show getShowById(int id) {
        return ShowDAO.getShow(id);
    }
}
