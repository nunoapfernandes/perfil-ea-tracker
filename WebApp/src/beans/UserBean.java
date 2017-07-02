package beans;

import model.User;
import persistence.UserDAO;

import javax.ejb.Stateless;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
@Stateless(name = "UserEJB")
public class UserBean implements UserBeanLocal{
    public UserBean() {}

    @Override
    public User login(String username, String password){
        return UserDAO.loadUserByLogin("username='"+username+"' AND password='"+password+"'");
    }

    @Override
    public void saveUser(User user) {
        UserDAO.save(user);
    }

    @Override
    public User getUserById(int id) {
        return UserDAO.loadUserById(id);
    }
}