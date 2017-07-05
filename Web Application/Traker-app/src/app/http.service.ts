
import { Injectable } from '@angular/core';
import { Http, Response } from '@angular/http';
import 'rxjs/add/operator/map';

@Injectable()
export class HttpService {
  constructor (
    private http: Http
  ) {}

  getMovies() {
    return this.http.get('http://localhost:80/movies')
      .map((res: Response) => res.json());
  }

  getMovie(movieid) {
    return this.http.get('http://localhost:80/movies/' + movieid)
      .map((res: Response) => res.json());
  }

  getShows() {
    return this.http.get('http://localhost:80/shows')
      .map((res: Response) => res.json());
  }

  getShow(showid) {
    return this.http.get('http://localhost:80/shows/' + showid)
      .map((res: Response) => res.json());
  }

  getSeason(showid, seasonNumber) {
    return this.http.get('http://localhost:80/shows/' + showid + '/seasons/' + seasonNumber)
      .map((res: Response) => res.json());
  }

  getUser(userid) {
    return this.http.get('http://localhost:80/user/' + userid)
      .map((res: Response) => res.json());
  }

  getWatcherMovies(userid) {
    return this.http.get('http://localhost:8080/WebApp/user/' + userid + '/watched/movies')
      .map((res: Response) => res.json());
  }

  getWatchedShows(userid) {
    return this.http.get('http://localhost:8080/WebApp/user/' + userid + '/watched/shows')
      .map((res: Response) => res.json());
  }

  getWathlistMovies(userid) {
    return this.http.get('http://localhost:8080/WebApp/user/' + userid + '/watchlist/movies')
      .map((res: Response) => res.json());
  }

  getWatchlistShows(userid) {
    return this.http.get('http://localhost:8080/WebApp/user/' + userid + '/watchlist/shows')
      .map((res: Response) => res.json());
  }

  getOverviews() {
    return this.http.get('http://localhost:8080/WebApp/overviews')
      .map((res: Response) => res.json());
  }

  login(userid) {
    return this.http.get('http://localhost:8080/WebApp/user/' + userid)
      .map((res: Response) => res.json());
  }

  logout(showid, seasonNumber) {
    return this.http.get('http://localhost:8080/WebApp/shows/' + showid + '/seasons/' + seasonNumber)
      .map((res: Response) => res.json());
  }






  postMovieRate() {
    return this.http.get('http://localhost:8080/WebApp/movies')
      .map((res: Response) => res.json());
  }

  postMovieComment() {
    return this.http.get('http://localhost:8080/WebApp/movies')
      .map((res: Response) => res.json());
  }

  postShowRate() {
    return this.http.get('http://localhost:8080/WebApp/movies')
      .map((res: Response) => res.json());
  }

  postShowComment() {
    return this.http.get('http://localhost:8080/WebApp/movies')
      .map((res: Response) => res.json());
  }



}
