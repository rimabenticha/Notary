import 'package:noteary/features/profile/data/models/expansion_model.dart';

final List<ExpansionModel> faqList = [
  ExpansionModel(
    headerValue: 'What is Noteary?',
    expandedValue:
        'Noteary is a note-taking application that allows you to create, organize, and manage your notes easily. You can write notes manually or use the speech-to-text feature to convert your voice into text. All your notes are securely stored and synchronized across your devices.',
  ),

  ExpansionModel(
    headerValue: 'How do I create a new note?',
    expandedValue:
        'To create a new note, tap the floating action button (microphone icon) on the home screen. Enter a title for your note, then either type your content or use the microphone button to speak and convert your speech to text. Once you\'re done, tap the save icon in the app bar to save your note.',
  ),

  ExpansionModel(
    headerValue: 'How does the speech-to-text feature work?',
    expandedValue:
        'The speech-to-text feature allows you to speak your notes instead of typing them. Simply tap the microphone button, grant microphone permissions when prompted, and start speaking. The app will convert your speech into text in real-time. You can speak for up to 2 minutes per session. The audio is processed locally on your device and is not stored.',
  ),

  ExpansionModel(
    headerValue: 'Is my data safe and private?',
    expandedValue:
        'Yes. We take your privacy and data security very seriously. All your notes and account information are encrypted and securely stored using Firebase services. Your notes are private and only accessible to you through your authenticated account. We never share your data with third parties without your consent. For more details, please review our Privacy Policy.',
  ),

  ExpansionModel(
    headerValue: 'Can I edit or delete my notes?',
    expandedValue:
        'Yes. You can edit your notes by tapping on any note from the home screen. Make your changes and save them. To delete a note, you can remove it from the note editing screen. All changes are automatically synchronized to your account.',
  ),

  ExpansionModel(
    headerValue: 'Do I need an account to use Noteary?',
    expandedValue:
        'Yes, you need to create an account to use Noteary. This ensures that your notes are securely stored and synchronized across your devices. You can sign up using your email address and a password. Your account allows you to access your notes from any device where you sign in.',
  ),

  ExpansionModel(
    headerValue: 'How do I change my password?',
    expandedValue:
        'You can change your password by going to the Profile section and selecting "Change Password". You will need to enter your current password and then set a new password. Make sure to choose a strong password to keep your account secure.',
  ),

  ExpansionModel(
    headerValue: 'Can I use Noteary offline?',
    expandedValue:
        'Noteary requires an internet connection to sync your notes with your account. However, you can create and edit notes while offline, and they will be synchronized once you regain internet connectivity. For the best experience, we recommend using the app with an active internet connection.',
  ),

  ExpansionModel(
    headerValue: 'What should I do if I forget my password?',
    expandedValue:
        'If you forget your password, you can reset it by tapping "Forgot Password" on the sign-in screen. Enter your email address, and you will receive instructions to reset your password via email. Follow the link in the email to create a new password.',
  ),

  ExpansionModel(
    headerValue: 'How do I contact support?',
    expandedValue:
        'If you have any questions, encounter issues, or want to provide feedback, you can contact us through the "Contact Us" feature in the Profile section. Fill out the contact form with your message, and our support team will get back to you as soon as possible.',
  ),

  // ExpansionModel(
  //   headerValue: 'Who should I contact for help or feedback?',
  //   expandedValue:
  //       'If you face any issues or have suggestions for improving the app, please reach out to our support team.\n\n'
  //       'Email: support@noteary.com\n'
  //       'You can also use the Contact Us feature in the app.\n\n'
  //       'We appreciate your feedback and are always here to help.',
  // ),
];
