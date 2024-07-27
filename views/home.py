import tkinter as tk
from tkinter import messagebox
import customtkinter as ctk
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from src.users import Users
from src.clubs import Clubs
from src.user_follow import UserFollow
from src.user_club import UserClub
from src.network import SocialNetwork

class MainApp(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.title("Social Network")
        self.geometry("800x600")
        ctk.set_appearance_mode("dark")

        self.current_page = None
        self.show_login_page()
    
    def show_login_page(self):
        self.clear_page()
        
        self.login_frame = ctk.CTkFrame(self)
        self.login_frame.pack(expand=True, fill='both')
        
        self.username = ctk.CTkEntry(self.login_frame, placeholder_text="Username")
        self.username.pack(pady=10)
        
        self.password = ctk.CTkEntry(self.login_frame, placeholder_text="Password", show="*")
        self.password.pack(pady=10)
        
        self.login_button = ctk.CTkButton(self.login_frame, text="Login", command=self.login)
        self.login_button.pack(pady=10)
            
    def login(self):
        username = self.username.get()
        password = self.password.get()
        
        user = Users()
        response = user.login(username, password)
        print('response')
        print(response)
        if response['login']:
            if response['is_admin']:
                self.show_admin_page()
            else:
                self.show_user_page()
        else:
            messagebox.showerror("Login Failed", response['Message'])

    def clear_page(self):
        for widget in self.winfo_children():
            widget.destroy()

if __name__ == "__main__":
    app = MainApp()
    app.mainloop()
