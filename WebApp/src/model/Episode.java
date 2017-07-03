package model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="episode")
@PrimaryKeyJoinColumn(name="episode_id", referencedColumnName = "id_media")
public class Episode extends Media implements Serializable{

    @Column(name = "runtime")
    private int runtime;
    @Column(name = "number")
    private int number;
    @Column(name = "imdb")
    private String imdb;
    @Column(name = "season_id", updatable = false, insertable = false)
    private int season_id;

    /*@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "season_id", nullable = false)
    private Season season;
    */
    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
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
}
