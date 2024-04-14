# TVShowApp

This project is a sample iOS application that fulfills the specified requirements.

## Project Setup Guide

To set up the project on your local machine, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/faisal330/tv-show-app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd <project-directory>
   ```

3. Install CocoaPods dependencies:
   ```bash
   pod install
   ```

4. Open the `.xcworkspace` file in Xcode:
   ```bash
   open TVShowApp.xcworkspace
   ```

## Requirements Implemented

1. **UI Design**: The design of the application matches the provided UI.
2. **iPhone Portrait Layout**: The application supports only iPhone portrait layout and disables iPad and landscape orientation.
3. **Codable Protocol**: Codable protocol is used for model representations.
4. **Modularity**: The code is structured to be reusable and modular.
5. **CocoaPods**: Only Kingfisher is used for image loading purposes.
6. **REST API Framework**: FSNetworkManager: A custom framework handles all REST API calls using URLSession.
7. **Video Page**: Implemented a basic AVKit video player accessible through a "Play", "Trailer" and "Episode Play" button in the Detail Page. Video URL is provided.
8. **Unit Tests**: Basic unit tests are introduced.

## Running the Tests

To run the unit tests, select the "Tests" scheme in Xcode and then press Cmd+U or navigate to Product -> Test.

## Additional Notes

Feel free to explore the project. If you have any questions, don't hesitate to reach out to me.
