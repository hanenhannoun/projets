import { Injectable } from '@angular/core';
import { BehaviorSubject, tap } from 'rxjs';
import { User } from '../shared/User';
import { Observable } from 'rxjs';
import { IUserLogin } from '../shared/interfaces/IUserLogin';
import { HttpClient } from '@angular/common/http';
import { USER_LOGIN_URL } from '../shared/constants/url';
//import { ToastrService } from 'ngx-toastr/public_api';
import { ToastrService } from 'ngx-toastr';
//import { ToastrService } from 'ngx-toastr/toastr/toastr.service';
//import { ToastrService } from 'ngx-toastr/toastr';



@Injectable({
  providedIn: 'root'
})
export class UserService {

  private userSubject = new BehaviorSubject<User>(new User());
  public userObservable:Observable<User>

  constructor(private http:HttpClient, private toastrService:ToastrService) { 
    this.userObservable=this.userSubject.asObservable();

  }
  login(userLogin:IUserLogin):Observable<User>{
    return this.http.post<User>(USER_LOGIN_URL, userLogin).pipe(tap({
      next: (user) => {
        this.toastrService.success(`Welcome To My Application ${user.name}!`,
          'Login Successful! 😄');

      },
      error: (errorResponse) => {
        this.toastrService.error(errorResponse.error, 'Login Failed!😞 ');

      }
    }));
  }
}
