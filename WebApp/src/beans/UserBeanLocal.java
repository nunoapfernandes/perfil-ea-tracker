package beans;

import model.User;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
public interface UserBeanLocal {
    User login(String username, String password);
    void saveUser(User user);
    User getUserById(int id);
}
