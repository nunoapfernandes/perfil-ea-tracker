package Beans;

import Model.User;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
public interface UserBeanLocal {
    User login(String username, String password);
    User saveUser(User user);
}
