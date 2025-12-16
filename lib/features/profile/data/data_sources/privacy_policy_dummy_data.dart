import 'package:noteary/features/profile/data/models/expansion_model.dart';

final List<ExpansionModel> privacyPolicyList = [
  ExpansionModel(
    headerValue: 'Introduction to the Privacy Policy',
    expandedValue:
        'This Privacy Policy explains how Noteary collects, uses, and protects your personal information when you use our note-taking application. We are committed to ensuring the privacy and security of your data while providing a reliable and efficient service for managing your notes. By using this app, you agree to the terms outlined in this policy.',
  ),

  ExpansionModel(
    headerValue: 'Information We Collect',
    expandedValue:
        'To provide our services effectively, we may collect the following types of information:\n\n'
        '- Account information: your email address, password (encrypted), and full name when you create an account.\n'
        '- Note content: the titles and content of notes you create, along with creation timestamps.\n'
        '- Audio data: when you use the speech-to-text feature, we access your microphone to convert your speech into text. Audio is processed locally and not stored.\n'
        '- Contact information: if you contact us through the app, we collect the information you provide in your message.\n'
        '- Device and usage information: technical data to improve app performance, security, and user experience.',
  ),

  ExpansionModel(
    headerValue: 'How We Use Your Information',
    expandedValue:
        'The data we collect is used only for purposes directly related to providing our note-taking service, such as:\n\n'
        '- Creating and managing your user account and authentication.\n'
        '- Storing and synchronizing your notes across your devices.\n'
        '- Enabling speech-to-text functionality for voice note creation.\n'
        '- Responding to your inquiries and support requests.\n'
        '- Improving the user experience and app functionality.\n'
        '- Communicating important updates, service notifications, or policy changes.',
  ),

  ExpansionModel(
    headerValue: 'Data Protection and Security',
    expandedValue:
        'We take data protection seriously and apply appropriate technical and organizational measures to safeguard your personal information from unauthorized access, alteration, disclosure, or destruction. Your notes and account data are stored securely using Firebase services with encryption in transit and at rest. Access to your data is limited only to you and authorized personnel who are required to maintain its confidentiality. We use industry-standard security practices to protect your information.',
  ),

  ExpansionModel(
    headerValue: 'Sharing of Information',
    expandedValue:
        'We do not sell, rent, or trade your personal information or note content. Your data is private and remains accessible only to you. Data is shared only under the following conditions:\n\n'
        '- Your notes are stored securely and are only accessible through your authenticated account.\n'
        '- We may share aggregated, anonymized data for analytics purposes that does not identify individual users.\n'
        '- When required by law or legal authorities to comply with legal obligations.\n\n'
        'Any data shared with third-party service providers (such as Firebase) is handled in accordance with strict privacy and security standards.',
  ),

  ExpansionModel(
    headerValue: 'User Rights',
    expandedValue:
        'You have the right to access, correct, update, or delete your personal information and notes at any time through your account settings. You can:\n\n'
        '- View and edit your profile information.\n'
        '- Create, edit, and delete your notes.\n'
        '- Delete your account, which will remove all associated data.\n'
        '- Withdraw your consent for data processing, except where it is required for legal or operational purposes.\n\n'
        'Requests related to your data can be made by contacting our support team through the Contact Us feature in the app.',
  ),

  ExpansionModel(
    headerValue: 'Data Retention',
    expandedValue:
        'Your personal data and notes will be retained as long as your account is active. If you delete your account, all associated data including your notes, profile information, and account details will be permanently removed from our systems. We may retain certain information for a limited period as required by law or for legitimate business purposes such as fraud prevention.',
  ),

  ExpansionModel(
    headerValue: 'Microphone and Speech Recognition',
    expandedValue:
        'When you use the speech-to-text feature, Noteary requests access to your device\'s microphone. Audio is processed in real-time to convert your speech into text and is not recorded or stored. The speech recognition is handled by your device\'s operating system, and we do not have access to the raw audio data. You can revoke microphone permissions at any time through your device settings.',
  ),

  ExpansionModel(
    headerValue: 'Children\'s Privacy',
    expandedValue:
        'Noteary is not intended for users under the age of 13. We do not knowingly collect personal data from children under 13. If we discover that a child under 13 has provided us with personal information without parental consent, we will delete it immediately. If you are a parent or guardian and believe your child has provided us with personal information, please contact us.',
  ),

  ExpansionModel(
    headerValue: 'Policy Updates',
    expandedValue:
        'We may update this Privacy Policy from time to time to reflect changes in our practices, technology, or legal requirements. When updates occur, we will notify users through in-app alerts or other appropriate means. The revised policy will take effect once published in the app. We encourage you to review this policy periodically to stay informed about how we protect your information.',
  ),
];
