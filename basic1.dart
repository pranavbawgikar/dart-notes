void main () {
  const minutesConst = 60; // Compile-time constant
  // `final` is initialized once at runtime
  var userName = '@pranavbawgikar';
  var followerCount = 1260000;
  var followingCount = 10;
  var watchHours = 12.6;
  var bio = '''Associate System Engineer
  Nuclei''';
  
  var hours = watchHours.toInt(); // 30
  var minutes = watchHours - hours; // 0.7
  minutes = minutes * minutesConst; // 42
  
  print('My username is $userName.'); 
  print('I have ${convertFollowers(followerCount)} followers.');
  print('I follow $followingCount accounts.');
  print('My screen time is $hours:${minutes.toInt()}'); // Using `toInt()` to truncate the fractional part of the minutes variable
  print('My bio: $bio');
}

String convertFollowers(int followerCount) {
    if (followerCount < 1000) {
      return '$followerCount';
  } else if ((followerCount > 1000) && (followerCount < 999999)) {
      return '${(followerCount / 1000).toStringAsFixed(1)}K';
  } else {
      return '${(followerCount / 1000000).toStringAsFixed(1)}M';
    }
}
