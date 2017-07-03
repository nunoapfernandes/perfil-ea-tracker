package beans;

import model.Show;
import persistence.ShowDAO;

import javax.ejb.Stateless;

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
