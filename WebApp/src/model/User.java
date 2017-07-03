package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

@Entity
@Table(name="usertr")
public class User implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_user", unique = true, nullable = false)
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

    @OneToMany(mappedBy = "usertr", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserMedia> medias = new ArrayList<>();


/*
    @OneToMany(mappedBy = "primaryKey.user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<UserMedia> userMedia = new LinkedList<UserMedia>() {};
*/

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

    public List<UserMedia> getMedias() {
        return medias;
    }

    public void setMedias(List<UserMedia> userMedias) {
        this.medias = userMedias;
    }

}

