import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/pages/home/home.component';
import { TagComponent } from './components/pages/tag/tag.component';
import { FoodPageComponent } from './components/pages/food-page/food-page.component';
import { CartPageComponent } from './components/pages/cart-page/cart-page.component';
import { LoginComponent } from './components/pages/login/login.component';
import { ChartsComponent } from './charts/charts.component';
import { CheckoutComponent } from './checkout/checkout.component';
import { PayComponent } from './pay/pay.component';

const routes: Routes = [
  {
    path:'', component:HomeComponent
  },
  {
    path:'search/:searchTerm', component:HomeComponent
  },
  {
    path:'tag/:tag', component:HomeComponent
  },
  {
    path:'food/:id', component:FoodPageComponent
  },
  {
    path:'cart-page', component:CartPageComponent
  },
  {
    path:'login', component:LoginComponent
  },
  {
    path:'charts', component:ChartsComponent
  },
  {
    path:'checkout', component:CheckoutComponent
  },
  {
    path:'pay', component:PayComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
