package persistence;

import model.*;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */
public class HibernateUtil {
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            // loads configuration and mappings
            Configuration configuration = new Configuration().configure();
            ServiceRegistry serviceRegistry
                    = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties()).build();

            // builds a session factory from the service registry
            sessionFactory = configuration.addAnnotatedClass(User.class).addAnnotatedClass(Movie.class).addAnnotatedClass(UserMedia.class).addAnnotatedClass(Show.class).addAnnotatedClass(Season.class).addAnnotatedClass(UserMediaId.class).addAnnotatedClass(Media.class).addAnnotatedClass(Episode.class).addAnnotatedClass(Genre.class).buildSessionFactory(serviceRegistry);
        }

        return sessionFactory;
    }
}