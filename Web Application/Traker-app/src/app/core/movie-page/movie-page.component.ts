

import { Component } from '@angular/core';
import { Genre } from '../../objects/genre.model'

import { User } from '../../objects/user.model'
import {HttpService} from "../../http.service";
import {ActivatedRoute} from "@angular/router";
import {Movie} from "app/objects/movie.model";


@Component({
  selector: 'app-movie-page',
  templateUrl: './movie-page.component.html',
  styleUrls: ['./movie-page.component.css'],
  providers: [HttpService],
})

export class MoviePageComponent {

  response2: Object = {};


  user: User = {
    id: 1234,
    username: 'teste',
    avatar: 'asdasda'
  };


  constructor(private route: ActivatedRoute, private httpService: HttpService) {
    this.route.params.subscribe(params => {
      this.httpService.getMovie(params['id'])
        .subscribe(data => this.response2 = data, a => console.log(a.message));
    });
  }



}
