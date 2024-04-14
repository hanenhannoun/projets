import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Observable } from 'rxjs';
import { FoodService } from 'src/app/services/food.service';
import { Food } from 'src/app/shared/Food';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit{
  foods:Food[]=[];
  constructor(private api:FoodService, activateRoute:ActivatedRoute){
    let foodObservable:Observable<Food[]>
    activateRoute.params.subscribe((params)=>{
      if(params.searchTerm)
      foodObservable=this.api.getAllFoodBySearchTerm(params.searchTerm)
      else if(params.tag)
      foodObservable= this.api.getAllFoodByTag(params.tag)
      else
      foodObservable= api.getAll()
      foodObservable.subscribe((serverFoods)=>{
        this.foods= serverFoods;
      })
    })
    
  }
  ngOnInit(){}

}
