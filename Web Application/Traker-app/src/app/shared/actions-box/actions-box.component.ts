
import { Component, Input } from '@angular/core';

import { User } from '../../objects/user.model'


@Component({
  selector: 'app-actions-box',
  templateUrl: './actions-box.component.html',
  styleUrls: ['./actions-box.component.css']
})

export class ActionsBoxComponent {

  @Input()
  user: User;

  @Input()
  watchlist: boolean;
  @Input()
  seen: boolean;
  @Input()
  rated: boolean;
  @Input()
  commented: boolean;


  testefunction(){
    console.log(this.user.username)
  }

}
