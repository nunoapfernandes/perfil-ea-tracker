package Model;

import javax.persistence.*;
import java.util.*;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name="user")
public class User {

    public User(){}

    @Id
    @GeneratedValue
    @Column(name = "id_user")
    private int id_user;
    @Column(name = "username")
    private String username;
    @Column(name = "password")
    private String password;
    @Column(name = "email")
    private String email;
    @Column(name = "about")
    private String about;
    @Column(name = "birthday")
    private Date birthday;
    @Column(name = "image_path")
    private String image_path;
    @Enumerated(EnumType.STRING)
    @Column(name = "gender")
    private GenderType gender;
    @OneToMany(mappedBy = "primaryKey.user", cascade = CascadeType.ALL)
    private List<UserMedia> userMedias = new LinkedList<UserMedia>() {};

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public GenderType getGender() {
        return gender;
    }

    public void setGender(GenderType gender) {
        this.gender = gender;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public List<UserMedia> getUserMedias() {
        return userMedias;
    }

    public void setUserMedias(List<UserMedia> userMedias) {
        this.userMedias = userMedias;
    }

    public void addUserMedia(UserMedia userMedia){
        this.userMedias.add(userMedia);
    }
}

