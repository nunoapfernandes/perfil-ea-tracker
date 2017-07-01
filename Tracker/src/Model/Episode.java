package Model;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by RicardoFerreira on 30/06/2017.
 */

@Entity
@Table(name="episode")
@PrimaryKeyJoinColumn(name="media_id", referencedColumnName = "id_media")
public class Episode extends Media{
    public Episode(){}

    @Id
    @GeneratedValue
    @Column(name = "id_episode")
    private int id_episode;
    @Column(name = "number")
    private int number;
    @Column(name = "imdb")
    private String imdb;
    @Column(name = "season_id")
    private int season_id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "season_id", nullable = false)
    private Show season;

    public int getId_episode() {
        return id_episode;
    }

    public void setId_episode(int id_episode) {
        this.id_episode = id_episode;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getImdb() {
        return imdb;
    }

    public void setImdb(String imdb) {
        this.imdb = imdb;
    }

    public int getSeason_id() {
        return season_id;
    }

    public void setSeason_id(int season_id) {
        this.season_id = season_id;
    }

    public Show getSeason() {
        return season;
    }

    public void setSeason(Show season) {
        this.season = season;
    }

}
