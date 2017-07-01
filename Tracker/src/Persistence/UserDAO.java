package Persistence;

import Model.GenderType;
import Model.Media;
import Model.User;
import Model.UserMedia;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import javax.jws.soap.SOAPBinding;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by RicardoFerreira on 01/07/2017.
 */
public class UserDAO {
    private static Session session;
    private static SessionFactory sessionFactory;

    public UserDAO(){
        sessionFactory = HibernateUtil.getSessionFactory();
        session = sessionFactory.openSession();
    }

    public static User loadUserById(int id){
        return (User) session.load(User.class, new Integer(id));
    }
    public static User loadUserByLogin(String queryAdd){
        Query query = session.createQuery("from User as User where " + queryAdd);

        return (User) query.getSingleResult();
    }

    public static void save(User user){
        session.saveOrUpdate(user);
        session.getTransaction().commit();
    }

    public static void registerUser(String username, String password, String email, String about, Date birthday, GenderType gender){
        if (!userExists(username)){
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setAbout(about);
            user.setBirthday(birthday);
            user.setGender(gender);

            //Save the invitation in database
            session.save(user);

            //Commit the transaction
            session.getTransaction().commit();
        }
    }

    public static User searchUser(String userName){
        User user;
        Query query = session.createQuery("from User where username=:name");
        query.setParameter("name", userName);
        user = (User) query.uniqueResult();
        return user;
    }

    public static boolean userExists(String name){
        User user = searchUser(name);
        if(user != null)
            return true;
        else
            return false;
    }

    public static void userWatched(Media media, User user, boolean state){
        UserMedia userMedia = new UserMedia();
        userMedia.setUser_id(user.getId_user());
        userMedia.setWatched(state);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        userMedia.setView_date(timestamp);
        userMedia.setMedia_id(media.getId_media());
        userMedia.setWatchlist(false);

        session.saveOrUpdate(userMedia);

        session.getTransaction().commit();
    }

    public static void userWatchList(Media media, User user, boolean state){
        UserMedia userMedia = new UserMedia();
        userMedia.setUser_id(user.getId_user());
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        userMedia.setAdd_date(timestamp);
        userMedia.setMedia_id(media.getId_media());
        userMedia.setWatchlist(state);

        session.saveOrUpdate(userMedia);

        session.getTransaction().commit();
    }

    public static void userComment(Media media, User user, String comment){
        UserMedia userMedia = new UserMedia();
        userMedia.setUser_id(user.getId_user());
        userMedia.setMedia_id(media.getId_media());
        userMedia.setComment(comment);

        session.saveOrUpdate(userMedia);

        session.getTransaction().commit();
    }


    public static void userRate(Media media, User user, int rate){
        UserMedia userMedia = new UserMedia();
        userMedia.setUser_id(user.getId_user());
        userMedia.setMedia_id(media.getId_media());
        userMedia.setRating(rate);

        session.saveOrUpdate(userMedia);

        session.getTransaction().commit();
    }


}
