import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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
    @OneToMany(mappedBy = "primaryKey.userMovie", cascade = CascadeType.ALL)
    private Set<UserMovie> userMovies = new HashSet<UserMovie>();
    @OneToMany(mappedBy = "primaryKey.userShow", cascade = CascadeType.ALL)
    private Set<UserShow> userShows = new HashSet<UserShow>();
    @OneToMany(mappedBy = "primaryKey.userSeason", cascade = CascadeType.ALL)
    private Set<UserSeason> userSeasons = new HashSet<UserSeason>();
    @OneToMany(mappedBy = "primaryKey.userEpisode", cascade = CascadeType.ALL)
    private Set<UserEpisode> userEpisodes = new HashSet<UserEpisode>();

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

    public Set<UserMovie> getUserMovies() {
        return userMovies;
    }

    public void setUserMovies(Set<UserMovie> userMovies) {
        this.userMovies = userMovies;
    }

    public void addUserMovie(UserMovie userMovie){
        this.userMovies.add(userMovie);
    }

    public Set<UserShow> getUserShows() {
        return userShows;
    }

    public void setUserShows(Set<UserShow> userShows) {
        this.userShows = userShows;
    }

    public void addUserShow(UserShow userShow){
        this.userShows.add(userShow);
    }

    public Set<UserSeason> getUserSeasons() {
        return userSeasons;
    }

    public void setUserSeasons(Set<UserSeason> userSeasons) {
        this.userSeasons = userSeasons;
    }

    public void addUserSeason(UserSeason userSeason){
        this.userSeasons.add(userSeason);
    }

    public Set<UserEpisode> getUserEpisodes() {
        return userEpisodes;
    }

    public void setUserEpisodes(Set<UserEpisode> userEpisodes) {
        this.userEpisodes = userEpisodes;
    }

    public void addUserEpisode(UserEpisode userEpisode){
        this.userEpisodes.add(userEpisode);
    }
}

