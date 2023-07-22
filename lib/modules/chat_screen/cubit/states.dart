abstract class ChatStates {}

class AppInitialState extends ChatStates{}

class LoadingResponse extends ChatStates{}
class GetResponseCorrectly extends ChatStates{}
class GetResponseError extends ChatStates{}