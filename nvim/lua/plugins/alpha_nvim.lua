return {
    name = "alpha-nvim",
    dir = "@alpha_nvim@",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local ahe_iroha = {
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠴⢋⡠⠖⠚⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⢤⣀⣈⠉⠓⠢⢤⣀⠀⠂⢤⣤⠒⠻⢝⠢⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⣀⠤⠤⢤⡀⠀⠀⢀⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠈⠳⡍⠛⠷⣭⣒⠬⣑⠢⣄⠈⠰⠄⠈⢇⠹⡀⠀⠀⢀⣠⣴⡶⢶⣄⠀⠀⠀⠀⠀",
            "⠀⠀⢀⠜⠻⣍⠑⠲⣜⣦⣀⣼⠁⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠈⠢⡀⠘⡄⠀⠈⠙⠳⡌⠳⣄⠙⢿⣿⡗⡼⢠⡇⣠⣶⣿⡉⠛⠢⣈⠘⣆⠀⠀⠀⠀",
            "⠀⢀⣀⣀⡀⠈⠳⠒⣸⢿⡿⢻⠀⠀⢱⡸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠻⣦⡀⠙⣄⠀⠀⠀⠀⠀⠈⢢⡘⡄⠀⠀⠀⠈⢢⡈⢷⣄⠙⢿⣷⣻⡿⣿⣯⣥⣄⠀⠀⣼⣿⣿⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠉⠉⠑⢲⢧⡟⠁⢸⡀⠀⠀⠱⣽⡄⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⡄⠈⢳⡄⠀⠀⠀⠀⠀⠱⣷⢄⠀⠀⠀⠀⠳⡀⢻⣷⡄⠹⣯⣿⣿⣿⣭⣶⣿⣶⣿⣿⣿⣆⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⢀⣟⣾⠀⠀⢸⡇⠀⠀⠀⠘⢿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⠀⠀⢻⣆⠀⠀⠀⠀⠀⢹⠀⡙⢦⡀⠀⠀⢱⠀⣿⠙⡄⠹⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣷⠀⠀",
            "⠀⠀⠀⠀⡼⠁⢸⠏⠈⠀⠀⢠⢹⠀⠀⠀⠀⠀⠙⢧⡀⠀⠀⢀⢤⣀⣀⣠⣬⣧⡶⠛⡟⢧⡀⠀⠀⠀⠀⠂⠈⠛⢿⣦⡀⠀⡇⡿⠀⢹⡀⣿⣟⠻⠻⠿⠷⠏⠙⢿⣿⣿⣷⠀⠀",
            "⠀⠀⠀⠀⠃⢀⡯⠀⠀⠀⠀⠘⡀⢇⠀⠀⠀⠀⠀⠀⠉⠢⣀⠈⠙⠛⠛⠒⠊⠙⠀⠀⢹⡏⠙⠳⢦⣄⡀⠀⠀⠀⠀⠹⣷⡄⠱⠃⠀⢀⣧⡟⣿⣷⣤⠀⡀⡄⣹⣿⣿⣿⡟⠀⠀",
            "⠀⠀⠀⡘⠀⡼⠃⠀⠀⠀⠀⠀⣇⠈⣆⠀⠀⠀⢰⣧⠀⠀⠈⠓⠦⣄⡀⠀⠀⠀⠀⢀⢸⡻⣆⠀⠀⠈⢻⡟⠒⠦⠤⣤⣹⣿⡀⠈⣆⡼⠛⢿⣾⣿⣟⠻⡿⣿⣿⣿⣿⣿⠇⠀⠀",
            "⠀⠀⠀⠃⢠⠃⠀⠀⠀⠀⠀⠀⢸⡀⠘⢧⡀⠀⣼⡇⠀⠀⠀⠀⠀⠀⠉⠉⣑⡿⠛⠉⢸⠀⣙⠤⠀⠀⡀⠛⢀⣀⢤⣀⣤⣤⢧⠀⢻⡀⠀⠀⢻⣿⣿⣯⠉⠉⠉⠛⢿⠁⠀⠀⠀",
            "⡖⠤⣀⡆⡼⡆⠀⠀⠀⠀⠀⠀⠀⢇⠀⠀⠙⢳⣿⣧⣤⣤⣤⣤⣤⣴⡶⠛⠉⠀⠀⠀⢸⠚⠁⠀⠀⣠⣷⣾⣽⣾⠟⠛⣟⡁⣼⠀⢸⡇⠀⠀⠀⢿⡏⢿⣇⠀⠳⣄⠀⠳⡀⠀⠀",
            "⡇⠀⠀⢏⡇⡇⠀⢀⠀⠀⠀⠀⠀⠘⣄⢦⢠⡿⠃⠀⠈⠉⠉⠁⠀⠀⠙⢦⣀⠀⠠⠀⡆⠀⠀⢠⢎⣴⡿⠟⢳⣙⡦⣺⢠⢃⢏⣠⣿⠃⠀⠀⠀⢸⡇⠀⢹⡄⠀⠈⠛⠦⠁⠀⠀",
            "⢸⠀⣴⣿⡇⡇⠀⢸⡆⠀⠀⠀⠀⠀⠘⣦⡻⣄⠀⠦⣀⠀⠀⠀⠈⠒⠤⣀⣙⣷⣶⣼⠃⠀⠀⣱⠟⢧⡤⢒⢏⢀⢇⠇⡟⡟⢏⢿⣽⠀⠀⠀⡆⠀⠀⠀⠀⢷⠀⠀⠀⠀⠀⠀⠀",
            "⢸⠴⠟⠁⡇⡇⠀⠀⢷⠀⠀⠀⢄⠀⢄⠈⢿⠺⣿⣦⣌⡑⠂⠀⠀⠀⠀⠀⠉⠙⠛⠛⠒⢀⠶⠃⠀⡖⡇⡜⡜⡘⡜⣸⢠⡿⠸⣏⠞⠀⠀⣰⠇⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀",
            "⢸⠀⢀⠀⢇⢸⠀⠀⠘⣇⠀⠀⠘⡄⠈⢳⡈⢣⡈⠛⠿⠿⢷⣦⣤⣀⣀⣀⣀⣀⣤⠴⠊⠁⡰⢸⠸⠸⢡⢣⢃⢧⢳⡇⠙⠷⠷⠩⢤⣶⡿⠋⠀⠀⠀⠀⠀⣼⣷⡀⠀⠀⠀⠀⠀",
            "⠏⠀⡟⠀⠸⡄⢧⠰⡀⠘⣆⠀⠀⠸⡄⠀⡟⢦⠳⡀⠘⠃⠀⠀⠈⡩⢝⣋⡭⠌⠻⣄⠀⣇⢇⢇⢇⠇⡌⡌⡘⡘⢸⡀⠀⠀⠑⢒⡻⠛⠁⠀⢀⣴⠂⠀⢠⠿⣭⣷⠀⠀⠀⠀⠀",
            "⠀⠀⢻⡒⠋⢳⡈⢧⠱⡄⠈⠆⠀⠀⠘⢄⠸⣠⠙⢿⣦⡠⣤⣴⣮⣾⠻⣅⡀⡰⠸⡘⠸⡘⡘⡘⡘⢰⢁⠇⠃⠁⠺⣧⡀⠹⡫⢥⣤⣤⣤⡴⠟⠁⢀⣴⠇⠀⠈⠃⠻⣷⠄⠀⠀",
            "⠀⠀⠀⠈⠉⡽⣷⣄⠱⣌⢦⡀⠀⢀⠀⠈⢳⣿⡇⢤⠈⠛⣪⣿⠛⣀⢔⣭⢇⢇⢇⠃⣇⠇⢧⢧⣷⣾⣮⣄⠀⠀⠀⠙⡷⠀⠈⠒⠿⣟⣶⣶⣶⣾⡿⠛⣄⡀⠀⠐⢾⡿⠵⠀⠀",
            "⠀⠀⠀⠀⡸⢸⢫⢻⣷⣬⣑⠝⠦⣈⠢⣄⡀⠙⢷⡀⢀⣼⠟⠹⡴⠃⣼⡝⡸⠸⡘⢸⡸⠸⠘⢸⣿⣿⠿⡿⣿⣦⠀⠀⠀⠀⠀⠀⠀⣹⣽⡍⣿⣯⠀⠀⠈⠛⣷⠊⠁⠀⠀⠀⠀",
            "⠀⠀⠀⠀⢷⢸⠸⣸⢻⣯⠻⡻⠿⠚⠓⠊⠙⢶⣤⣽⣿⠯⢰⢺⢱⢱⣏⢇⠇⣇⠂⠀⠁⠀⠀⠘⣿⣏⠀⠈⢊⡿⡇⠀⠀⠀⠀⠀⣸⡿⣿⣿⣿⣯⡳⣄⠀⡰⠁⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⣀⣤⡿⢖⣿⡈⣿⣷⡙⢶⣄⡀⠀⠀⠀⠈⠙⠛⠳⠮⠭⠮⢾⢿⠈⢸⠘⠀⠀⠀⠀⠀⠀⠙⢿⡶⠶⢟⡱⠺⣄⠀⠀⠀⣰⠻⣿⣾⣷⣛⣿⣿⣾⣿⠁⠀⠀⠀⠀⠀⠀⠀",
            "⠀⢰⣿⣿⡟⣜⣸⣿⣧⠹⣿⣿⣦⡈⠛⠓⠒⠒⠀⠀⠀⠀⠀⢀⣴⡻⠃⡇⠀⠀⢰⡄⠀⠀⠀⠀⠀⠀⢏⡏⠁⠀⠀⠹⠆⠀⣼⠇⠀⠙⢿⣿⣧⠘⡦⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⢸⣿⣿⡿⢻⣿⣿⣿⣷⣝⣿⣿⣿⣳⣦⠤⣄⣀⣀⣤⡴⣾⣿⢾⣄⠐⠁⣀⠀⢀⡏⢆⠀⠀⢰⡀⠀⠈⣷⡀⠀⠀⠀⢀⡴⡏⠀⣇⡀⠀⠙⢋⢧⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠘⣿⣿⣿⣿⣿⡏⢻⣿⣏⢽⣿⣿⡼⢸⡦⣀⣈⣉⣩⠽⠟⠉⠈⠙⠳⢤⣀⣠⢾⠁⠘⡇⠀⣈⠃⢀⣀⣸⣣⡤⢔⡒⠉⠀⠀⠀⠈⢾⢀⡔⠁⠈⡆⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠙⣿⡿⢻⠏⠇⢘⣿⣿⣾⣿⣿⡇⠘⡇⢹⣽⣿⠲⡄⠀⠀⠀⠀⠀⠈⠉⠠⠃⠀⠀⠑⠈⠛⢹⡿⣷⣄⠉⠁⠀⠻⡆⠀⠀⠀⠀⠀⠘⠀⠀⠀⢹⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⢀⡏⠀⠀⠹⠿⢿⣿⣿⡿⡇⠀⠸⡌⣿⣺⣆⠘⠦⣄⡀⠀⠀⠀⠀⠀⠀⣰⡇⡆⠀⠐⢹⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡏⡆⡄⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⣀⡈⠓⠤⣄⡀⣴⣿⣿⣿⠟⡇⢀⠀⢸⣿⣿⣛⣦⡀⠀⠉⠀⠀⠀⠀⢀⣴⣿⣵⠁⢸⡄⣸⡇⣟⣯⡯⣅⡠⠔⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⡇⠻⡆⠀⠀⠀⠀⠀⠀",
            "⠀⠀⡞⠉⠻⣧⠀⠀⠉⠙⡟⠛⠛⠀⢳⠘⢦⠈⠛⠙⢿⣓⣽⠢⢤⣀⣠⣤⣴⣯⣴⢻⣿⡤⠾⠿⠮⠷⠯⠤⠚⠊⠓⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠇⠀⠀⠀⠀⠀⠀⠀⠀",
        }
        local gehenna_logo = {
            "⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⢀⣰⣿⡇⠀⠀⠀⠀⠀⠀⠀⣴⣿⡇⠀⠀⠀⠀⠀⠀⠀⣰⣿⡇⠀⠀⠀⠀⠀⠀⢀⣰⣿⡇⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⣠⣾⣿⣿⡇⠀⠀⠀⠀⠀⣠⣿⣿⣿⡇⠀⠀⠀⠀⠀⣠⣾⣿⣿⡇⠀⠀⠀⠀⠀⣠⣾⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⣠⣾⣿⣿⣿⣿⡇⠀⠀⠀⢠⣾⣿⣿⣿⣿⡇⠀⠀⠀⢠⣾⣿⣿⣿⣿⡇⠀⠀⠀⣀⣾⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀",
            "⢀⣴⣿⣿⣿⣿⣿⣿⡇⠀⢀⣼⣿⣿⣿⣿⣿⣿⡇⠀⢀⣴⣿⣿⣿⣿⣿⣿⡇⠀⢀⣴⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀",
            "⠙⠿⣿⣿⣿⣿⣿⣿⣷⣤⡙⠿⣿⣿⣿⣿⣿⣿⣷⣤⡙⠿⣿⣿⣿⣿⣿⣿⣷⣤⡉⠉⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠈⠛⢿⣿⣿⣿⣿⣿⣿⣶⣌⡛⢿⣿⣿⣿⣿⣿⣿⣶⣌⡛⢿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣿⣿⣿⣦⣍⠻⢿⣿⣿⣿⣿⣿⣿⣦⣌⠻⢿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣿⣿⣿⣿⣦⣙⠻⣿⣿⣿⣿⣿⣿⣷⣦⡙⠻⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣷⣬⡙⢿⣿⣿⣿⣿⣿⣿⣷⣬⡙⠿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⣿⣿⣿⣿⣿⣿⣷⣬⡙⢿⣿⣿⣿⣿⣿⣿⣷⣤⡙⠿⣿⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⣿⣿⣿⣿⣿⣿⣿⣶⠌⠛⣿⣿⣿⣿⣿⣿⣿⣷⠌⠛⠿⠿⠿⠿⠿⠿⠿⠷⠄",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣄⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        }
        local neovim_logo1 = {
            "                                                                       ",
            "                                                                     ",
            "       ████ ██████           █████      ██                     ",
            "      ███████████             █████                             ",
            "      █████████ ███████████████████ ███   ███████████   ",
            "     █████████  ███    █████████████ █████ ██████████████   ",
            "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
            "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
            " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
            "                                                                       ",
        }
        dashboard.section.header.val = neovim_logo1
        dashboard.section.buttons.val = {
            dashboard.button("e", " 󰝒 > New file", ":enew<CR>"),
            dashboard.button("f", " 󰈞 > Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "  > Recently used files", ":Telescope oldfiles<CR>"),
            dashboard.button("g", " 󰈬 > Find word", ":Telescope live_grep<CR>"),
            dashboard.button("q", "  > Exit", ":qa<CR>"),
        }
        dashboard.config.opts.noautocmd = true

        alpha.setup(dashboard.config)
    end,
}
