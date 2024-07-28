import tkinter as tk
from tkinter import messagebox
import customtkinter as ctk
import webbrowser

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
        self.is_login = False
        self.user_info = {}
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
        
        self.register_button = ctk.CTkButton(self.login_frame, text="Register", command=self.show_register_page)
        self.register_button.pack(pady=10)
    
    def show_register_page(self):
        self.clear_page()
        
        self.register_frame = ctk.CTkFrame(self)
        self.register_frame.pack(expand=True, fill='both')
        
        self.reg_username = ctk.CTkEntry(self.register_frame, placeholder_text="Username")
        self.reg_username.pack(pady=10)
        
        self.reg_password = ctk.CTkEntry(self.register_frame, placeholder_text="Password", show="*")
        self.reg_password.pack(pady=10)
        
        self.reg_name = ctk.CTkEntry(self.register_frame, placeholder_text="Name")
        self.reg_name.pack(pady=10)
        
        self.register_button = ctk.CTkButton(self.register_frame, text="Register", command=self.register)
        self.register_button.pack(pady=10)
        
        self.back_button = ctk.CTkButton(self.register_frame, text="Back to Login", command=self.show_login_page)
        self.back_button.pack(pady=10)
    
    def login(self):
        username = self.username.get()
        password = self.password.get()
        
        user = Users()
        response = user.login(username, password)
        if response['login']:
            self.is_login = True
            self.user_info = response['user_info']
            if response['is_admin']:
                self.show_admin_page()
            else:
                self.show_user_page()
        else:
            self.is_login = False
            self.user_info = {}
            messagebox.showerror("Login Failed", response['Message'])

    def register(self):
        username = self.reg_username.get()
        password = self.reg_password.get()
        name = self.reg_name.get()
        values = {'username':username, "name":name, "password":password, "is_admin":0}
        user = Users()
        if user.add_user(values):
            messagebox.showinfo("Success", "Registration successful. Please log in.")
            self.show_login_page()
        else:
            messagebox.showerror("Error", "Registration failed")
        
    def show_statistics_page(self):
        self.clear_page()
        
        self.statistics_frame = ctk.CTkFrame(self)
        self.statistics_frame.pack(expand=True, fill='both')
        users = Users()
        clubs = Clubs()
        total_users = users.count_user()
        total_clubs = clubs.count_club()
        
        users_label = ctk.CTkLabel(self.statistics_frame, text=f"Total Users: {total_users}")
        users_label.pack(pady=10)
        
        clubs_label = ctk.CTkLabel(self.statistics_frame, text=f"Total Clubs: {total_clubs}")
        clubs_label.pack(pady=10)
        
        back_button = ctk.CTkButton(self.statistics_frame, text="Back to Admin Page", command=self.show_admin_page)
        back_button.pack(pady=10)
    
    def show_user_page(self):
        self.clear_page()
        
        self.user_frame = ctk.CTkFrame(self)
        self.user_frame.pack(expand=True, fill='both')
        
        self.update_profile_button = ctk.CTkButton(self.user_frame, text="Update Profile", command=self.show_profile_page)
        self.update_profile_button.pack(pady=10)
        
        self.join_club_button = ctk.CTkButton(self.user_frame, text="Join Club", command=self.show_user_clubs_page)
        self.join_club_button.pack(pady=10)
        
        self.follow_user_button = ctk.CTkButton(self.user_frame, text="Follow User", command=self.show_follow_user_page)
        self.follow_user_button.pack(pady=10)
                
        # self.stats_button = ctk.CTkButton(self.user_frame, text="Statistics", command=self.show_statistics)
        # self.stats_button.pack(pady=10)
        
        self.logout_button = ctk.CTkButton(self.user_frame, text="Logout", command=self.logout)
        self.logout_button.pack(pady=10)
    
    def show_admin_page(self):
        self.clear_page()
        
        self.admin_frame = ctk.CTkFrame(self)
        self.admin_frame.pack(expand=True, fill='both')
        
        self.update_profile_button = ctk.CTkButton(self.admin_frame, text="Update Profile", command=self.show_profile_page)
        self.update_profile_button.pack(pady=10)
        
        self.statistics_button = ctk.CTkButton(self.admin_frame, text="Statistics", command=self.show_statistics_page)
        self.statistics_button.pack(pady=10)

        self.manage_users_button = ctk.CTkButton(self.admin_frame, text="Manage Users", command=self.show_manage_users_page)
        self.manage_users_button.pack(pady=10)
        
        self.manage_clubs_button = ctk.CTkButton(self.admin_frame, text="Manage Clubs", command=self.show_manage_clubs_page)
        self.manage_clubs_button.pack(pady=10)
        
        self.show_club_followers = ctk.CTkButton(self.admin_frame, text="Show club followers network", command=self.open_clubs_graph_network)
        self.show_club_followers.pack(pady=10)

        self.show_user_followers = ctk.CTkButton(self.admin_frame, text="Show users followers network", command=self.open_user_fllowers_graph_network)
        self.show_user_followers.pack(pady=10)

        self.logout_button = ctk.CTkButton(self.admin_frame, text="Logout", command=self.logout)
        self.logout_button.pack(pady=10)
    
    def show_profile_page(self):
        self.clear_page()
        
        self.profile_frame = ctk.CTkFrame(self)
        self.profile_frame.pack(expand=True, fill='both')
        
        self.pro_username = ctk.CTkEntry(self.profile_frame, placeholder_text="Username")
        self.pro_username.pack(pady=10)
        username_value = self.user_info['username']
        self.pro_username.insert(0, username_value) 
        self.pro_username.configure(state='disabled')
        
        
        self.pro_name = ctk.CTkEntry(self.profile_frame, placeholder_text="Name")
        self.pro_name.pack(pady=10)
        name_value = self.user_info['name']
        self.pro_name.insert(0, name_value)
        
        
        self.pro_password = ctk.CTkEntry(self.profile_frame, placeholder_text="Password", show="*")
        self.pro_password.pack(pady=10)

        self.profile_button = ctk.CTkButton(self.profile_frame, text="Update Profile", command=self.update_profile)
        self.profile_button.pack(pady=10)
        if(self.user_info['is_admin'] == 0):
            self.back_button_pro = ctk.CTkButton(self.profile_frame, text="Back to User Page", command=self.show_user_page)
        else:
            self.back_button_pro = ctk.CTkButton(self.profile_frame, text="Back to Admin Page", command=self.show_admin_page)
        self.back_button_pro.pack(pady=10)
    
    def update_profile(self):
        username = self.pro_username.get()
        password = self.pro_password.get()
        name = self.pro_name.get()
        values = { "name":name, "password":password, "is_admin":self.user_info['is_admin']}
        user = Users()
        if user.update_user(username,values):
            messagebox.showinfo("Success", "Update Profile successful.")
        else:
            messagebox.showerror("Error", "Update Profile failed")
        

    def show_manage_users_page(self):
        self.clear_page()

        # Create a frame for the canvas
        self.canvas_frame = ctk.CTkFrame(self)
        self.canvas_frame.pack(expand=True, fill='both')

        # Create a canvas widget
        self.canvas = ctk.CTkCanvas(self.canvas_frame, bg='white')
        self.canvas.pack(side='left', fill='both', expand=True)

        # Create a scrollbar widget
        self.scrollbar = ctk.CTkScrollbar(self.canvas_frame, command=self.canvas.yview)
        self.scrollbar.pack(side='right', fill='y')

        # Configure the canvas to use the scrollbar
        self.canvas.configure(yscrollcommand=self.scrollbar.set)

        # Create a frame to contain the content and place it on the canvas
        self.manage_users_frame = ctk.CTkFrame(self.canvas)
        self.canvas.create_window((0, 0), window=self.manage_users_frame, anchor='nw')

        # Bind the canvas resize event to update the scroll region
        self.manage_users_frame.bind("<Configure>", lambda e: self.canvas.configure(scrollregion=self.canvas.bbox("all")))

        user = Users()
        user_list = user.select_user()

        for user in user_list:
            if user['is_admin'] == 0:
                user_frame = ctk.CTkFrame(self.manage_users_frame)
                user_frame.pack(pady=5, padx=10, fill='x')
                
                username_label = ctk.CTkLabel(user_frame, text=user['username'])
                username_label.pack(side='left', padx=10)
                
                delete_button = ctk.CTkButton(user_frame, text="Delete", command=lambda u=user['username']: self.delete_user(u))
                delete_button.pack(side='right', padx=10)

        back_button = ctk.CTkButton(self.manage_users_frame, text="Back to Admin Page", command=self.show_admin_page)
        back_button.pack(pady=10)

    def delete_user(self, username):
        confirm = messagebox.askyesno("Confirm Delete", f"Are you sure you want to delete user {username}?")
        if confirm:
            user = Users()
            result = user.delete_user(username)
            if result:
                messagebox.showinfo("Success", f"User {username} deleted successfully.")
                self.show_manage_users_page()
            else:
                messagebox.showerror("Error", f"Failed to delete user {username}.")
                
    def show_manage_clubs_page(self):
        self.clear_page()

        # Create a frame for the canvas
        self.canvas_frame = ctk.CTkFrame(self)
        self.canvas_frame.pack(expand=True, fill='both')

        # Create a canvas widget
        self.canvas = ctk.CTkCanvas(self.canvas_frame, bg='white')
        self.canvas.pack(side='left', fill='both', expand=True)

        # Create a scrollbar widget
        self.scrollbar = ctk.CTkScrollbar(self.canvas_frame, command=self.canvas.yview)
        self.scrollbar.pack(side='right', fill='y')

        # Configure the canvas to use the scrollbar
        self.canvas.configure(yscrollcommand=self.scrollbar.set)

        # Create a frame to contain the content and place it on the canvas
        self.manage_clubs_frame = ctk.CTkFrame(self.canvas)
        self.canvas.create_window((0, 0), window=self.manage_clubs_frame, anchor='nw')

        # Bind the canvas resize event to update the scroll region
        self.manage_clubs_frame.bind("<Configure>", lambda e: self.canvas.configure(scrollregion=self.canvas.bbox("all")))

        clubs = Clubs()
        clubs_info = clubs.select_club()

        for club in clubs_info:
            club_frame = ctk.CTkFrame(self.manage_clubs_frame)
            club_frame.pack(pady=5, padx=10, fill='x')

            name_label = ctk.CTkLabel(club_frame, text=club['name'])
            name_label.pack(side='left', padx=10)

            delete_button = ctk.CTkButton(club_frame, text="Delete", command=lambda club_code=club['club_code']: self.delete_club(club_code))
            delete_button.pack(side='right', padx=10)

            update_button = ctk.CTkButton(club_frame, text="Update", command=lambda club_code=club['club_code']: self.update_club_page(club_code))
            update_button.pack(side='right', padx=10)

        add_club_button = ctk.CTkButton(self.manage_clubs_frame, text="Add Club", command=self.update_club_page)
        add_club_button.pack(pady=10)

        back_club_list_button = ctk.CTkButton(self.manage_clubs_frame, text="Back to Admin Page", command=self.show_admin_page)
        back_club_list_button.pack(pady=10)
        

    def delete_club(self, club_code):
        confirm = messagebox.askyesno("Confirm Delete", f"Are you sure you want to delete club {club_code}?")
        if confirm:
            clubs = Clubs()
            result = clubs.delete_club(club_code)
            if result:
                messagebox.showinfo("Success", f"Club {club_code} deleted successfully.")
                self.show_manage_clubs_page()
            else:
                messagebox.showerror("Error", f"Failed to delete Club {club_code}.")
                
    def update_club_page(self,club_code = ""):
        self.clear_page()
        
        self.update_club_frame = ctk.CTkFrame(self)
        self.update_club_frame.pack(expand=True, fill='both')
        
        self.clu_club_code = ctk.CTkEntry(self.update_club_frame, placeholder_text="Code")
        self.clu_club_code.pack(pady=10)
        
        self.clu_club_name = ctk.CTkEntry(self.update_club_frame, placeholder_text="Name")
        self.clu_club_name.pack(pady=10)
        
        self.clu_club_description = ctk.CTkEntry(self.update_club_frame, placeholder_text="Description")
        self.clu_club_description.pack(pady=10)
        
        if(club_code == ""):
            self.update_club_button = ctk.CTkButton(self.update_club_frame, text="Add Club", command=self.add_club)
            self.update_club_button.pack(pady=10)
        else:
            clubs = Clubs()
            clubs_info = clubs.select_club(club_code)[0]
            self.clu_club_description.insert(0, clubs_info['description'])
            self.clu_club_name.insert(0, clubs_info['name'])
            self.clu_club_code.insert(0, clubs_info['club_code']) 
            self.clu_club_code.configure(state='disabled')
            self.update_club_button = ctk.CTkButton(self.update_club_frame, text="Update Club", command=self.update_club)
            self.update_club_button.pack(pady=10)
            
        self.back_button_club = ctk.CTkButton(self.update_club_frame, text="Back to Clubs Page", command=self.show_manage_clubs_page)
        self.back_button_club.pack(pady=10)
        
    def update_club(self):
        name = self.clu_club_name.get()
        description = self.clu_club_description.get()
        code = self.clu_club_code.get()
        values = { "name":name, "description":description}
        clubs = Clubs()
        if clubs.update_club(code,values):
            messagebox.showinfo("Success", "Update Club successful.")
        else:
            messagebox.showerror("Error", "Update Club failed")
        
    def add_club(self):
        name = self.clu_club_name.get()
        description = self.clu_club_description.get()
        code = self.clu_club_code.get()
        values = { "name":name, "description":description,"club_code":code}
        clubs = Clubs()
        if clubs.add_club(values):
            messagebox.showinfo("Success", "Add Club successful.")
        else:
            messagebox.showerror("Error", "Add Club failed")

    def logout(self):
        self.is_login = False
        self.user_info = {}
        self.clear_page()
        self.show_login_page()
    
    def clear_page(self):
        for widget in self.winfo_children():
            widget.destroy()

    def open_clubs_graph_network(self):
        clus_user_network = SocialNetwork()
        clus_user_network.user_club_network()

        html_file_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'network_graph', "club_followers_network.html"))

        if os.path.exists(html_file_path):
            webbrowser.open_new_tab(f"file://{html_file_path}")
        else:
            messagebox.showerror("Error", f"File not found: {html_file_path}")
            
    def open_user_fllowers_graph_network(self):
        follow_user_network = SocialNetwork()
        follow_user_network.user_follow_network()

        html_file_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'network_graph', "user_follow_network.html"))

        if os.path.exists(html_file_path):
            webbrowser.open_new_tab(f"file://{html_file_path}")
        else:
            messagebox.showerror("Error", f"File not found: {html_file_path}")

    def show_user_clubs_page(self):
        self.clear_page()
        
        # Create a canvas and a scrollbar
        self.canvas = tk.Canvas(self, borderwidth=0)
        self.scrollbar = tk.Scrollbar(self, orient='vertical', command=self.canvas.yview)
        
        # Create a frame to hold the user clubs content
        self.user_clubs_frame = ctk.CTkFrame(self.canvas)
        
        # Add the user_clubs_frame to the canvas
        self.canvas.create_window((0, 0), window=self.user_clubs_frame, anchor='nw')
        self.user_clubs_frame.bind('<Configure>', self.on_frame_configure)
        
        # Pack the canvas and scrollbar
        self.canvas.pack(side='left', fill='both', expand=True)
        self.scrollbar.pack(side='right', fill='y')
        
        # Configure canvas and scrollbar
        self.canvas.configure(yscrollcommand=self.scrollbar.set)
        self.scrollbar.config(command=self.canvas.yview)

        clubs = Clubs()
        user_club = UserClub()

        clubs_info = clubs.select_club()
        
        for club in clubs_info:
            user_club_frame = ctk.CTkFrame(self.user_clubs_frame)
            user_club_frame.pack(pady=5, padx=10, fill='x')
            
            name_label = ctk.CTkLabel(user_club_frame, text=club['name'])
            name_label.pack(side='left', padx=10)
            if(user_club.is_user_join_club(self.user_info['username'], club['club_code'])):
                user_join_club = ctk.CTkButton(user_club_frame, text="Leave Club", command=lambda club_code=club['club_code']: self.user_club_join(club_code, True))
                user_join_club.pack(side='right', padx=10)
            else:
                user_join_club = ctk.CTkButton(user_club_frame, text="Join Club", command=lambda club_code=club['club_code']: self.user_club_join(club_code, False))
                user_join_club.pack(side='right', padx=10)
        
        back_user_clubs_list_button = ctk.CTkButton(self.user_clubs_frame, text="Back to User Page", command=self.show_user_page)
        back_user_clubs_list_button.pack(pady=10)
    
    def on_frame_configure(self, event):
        # Update the scroll region of the canvas to encompass the full size of the frame
        self.canvas.configure(scrollregion=self.canvas.bbox('all'))

    def on_frame_configure(self, event):
        self.canvas.configure(scrollregion=self.canvas.bbox('all'))

    def user_club_join(self,club_code,user_join_state):
        user_club = UserClub()
        if(user_join_state):
            message = "Leave Club successful "
            result = user_club.un_follow_club(self.user_info['username'],club_code)
        else:
            message = "Join Club successful "
            result = user_club.follow_club(self.user_info['username'],club_code)
        
        if result:
            messagebox.showinfo("Success", message)
        else:
            messagebox.showerror("Error", "join/leave Club failed")
            
        self.show_user_clubs_page()

    def show_follow_user_page(self):
        self.clear_page()
        
        # Create a canvas and a scrollbar
        self.canvas = tk.Canvas(self, borderwidth=0)
        self.scrollbar = tk.Scrollbar(self, orient='vertical', command=self.canvas.yview)
        
        # Create a frame to hold the user clubs content
        self.follow_user_frame = ctk.CTkFrame(self.canvas)
        
        # Add the follow_user_frame to the canvas
        self.canvas.create_window((0, 0), window=self.follow_user_frame, anchor='nw')
        self.follow_user_frame.bind('<Configure>', self.on_frame_configure)
        
        # Pack the canvas and scrollbar
        self.canvas.pack(side='left', fill='both', expand=True)
        self.scrollbar.pack(side='right', fill='y')
        
        # Configure canvas and scrollbar
        self.canvas.configure(yscrollcommand=self.scrollbar.set)
        self.scrollbar.config(command=self.canvas.yview)

        user_follow = UserFollow()

        user_follows_info = user_follow.Suggestions_base_on_Followers_Followers(self.user_info['username'])
        
        for user_follow in user_follows_info:
            user_follow_frame = ctk.CTkFrame(self.follow_user_frame)
            user_follow_frame.pack(pady=5, padx=10, fill='x')
            
            name_label = ctk.CTkLabel(user_follow_frame, text=user_follow['suggested_user'])
            name_label.pack(side='left', padx=10)
            user_join_club = ctk.CTkButton(user_follow_frame, text="Follow user", command=lambda to_user=user_follow['suggested_user']: self.user_follow(to_user))
            user_join_club.pack(side='right', padx=10)
        
        back_user_clubs_list_button = ctk.CTkButton(self.follow_user_frame, text="Back to User Page", command=self.show_user_page)
        back_user_clubs_list_button.pack(pady=10)
    

if __name__ == "__main__":
    app = MainApp()
    app.mainloop()
