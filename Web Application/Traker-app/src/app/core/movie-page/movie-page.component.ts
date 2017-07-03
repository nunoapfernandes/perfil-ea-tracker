

import {Component } from '@angular/core';

import { User } from '../../objects/user.model'


@Component({
  selector: 'app-movie-page',
  templateUrl: './movie-page.component.html',
  styleUrls: ['./movie-page.component.css']
})

export class MoviePageComponent {

  user: User = {
    id: 1234,
    username:"teste",
    avatar: "asdasda"
  }


}
