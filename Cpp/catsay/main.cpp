#include <iostream>

constexpr int DEFAULT_SIZE(int message_size) {
    if (message_size < 20) {
        return 20;
    }

    return message_size + 10;
};

void print_box(int def_size, const std::string& empty_spaces, const std::string& message) {
    std::cout << std::string(def_size, '-') << std::endl;

    std::cout << '<' << empty_spaces << message << empty_spaces << '>' << std::endl;

    std::cout << std::string(def_size, '-');

    auto cat = R"(
  )  /\_/\   /
 (_ ( ^.^ ) /
   )  \"/
    ( | | )
   (__d b__))";

    std::cout << cat << std::endl;
}

void box_message(const std::string& message) {
    auto message_size = message.size();
    int def_size = DEFAULT_SIZE(message_size);
    
    if (message_size % 2 == 0) {
        auto empty_spaces_size = (def_size - message_size) / 2;
        std::string empty_spaces = std::string(empty_spaces_size - 1, ' '); 

        print_box(def_size, empty_spaces, message);
    } else {
        auto new_default_size = def_size - 1;
        auto empty_spaces_size = (new_default_size - message_size) / 2;
        std::string empty_spaces = std::string(empty_spaces_size - 1, ' '); 

        print_box(new_default_size, empty_spaces, message);
    }
}

int main() {
    std::string input;
    std::cout << "Your message: ";
    std::getline(std::cin, input); 
    box_message(input);
    return 0;
}

