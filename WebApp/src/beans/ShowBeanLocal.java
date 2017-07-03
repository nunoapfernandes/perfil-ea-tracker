package beans;

import model.Show;

public interface ShowBeanLocal {
    void save(Show show);
    Show getShowById(int id);
}
