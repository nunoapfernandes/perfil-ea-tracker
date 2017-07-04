/**
 * Created by RicardoFerreira on 02/07/2017.
 */
import { Component } from '@angular/core';
import 'rxjs/add/operator/map';
import 'rxjs/Rx'
import {HttpService} from '../../http.service';

@Component({
  selector: 'app-mediagrid-movie',
  templateUrl: './mediagrid-movie.component.html',
  styleUrls: ['./mediagrid-movie.component.css'],
  providers: [HttpService],
})

export class MediaGridMovieComponent {
  response: Object = {};

  constructor(private httpService: HttpService) {
    this.httpService.getMovies().subscribe(data => console.log(this.response = data));

    //console.log(this.response["title"]);
    /*
    http.get('http://localhost:8080/WebApp/home2')
      .map(response => this.response = response.json())
      .subscribe(function(response) {console.log(response)},
        function(error) { console.log('Error happened' + error)},
        function() { console.log('the subscription is completed')}
      );
      */
  }

  range = (value) => {
    let a = [];
    for ( let i = 0; i < value; ++i) {
      a.push(i);
    }
    return a;
  }

}


