-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2023 at 01:11 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testing`
--

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`) VALUES
(1, 'Java'),
(2, 'Javascript'),
(3, 'AJAX'),
(4, 'Angular JS'),
(5, 'PHP'),
(6, 'HTML5'),
(7, 'Python'),
(8, 'NodeJS'),
(9, 'C#'),
(10, 'SAP'),
(11, 'Flex'),
(12, 'C++'),
(13, 'Ruby'),
(14, 'TypeScript'),
(15, 'Kotlin'),
(16, 'Springboot'),
(17, 'API'),
(18, 'CSS'),
(19, 'SQL'),
(20, 'Perl'),
(21, 'C'),
(22, 'Fedora'),
(23, 'Red Hat'),
(24, 'Debian'),
(25, 'Mac OS x'),
(26, 'Oracel'),
(27, 'Web API'),
(28, 'Sliverlight'),
(29, 'windows'),
(31, 'Flex'),
(32, '.NET'),
(33, 'iOS'),
(34, 'Go'),
(35, 'T-sql'),
(36, 'XML'),
(37, 'COBOL'),
(38, 'Reactjs'),
(39, 'Groovy'),
(40, 'R'),
(41, 'APEX');

-- --------------------------------------------------------

--
-- Table structure for table `relation`
--

CREATE TABLE `relation` (
  `id` int(11) NOT NULL,
  `tools_id` int(11) NOT NULL,
  `tech_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `relation`
--

INSERT INTO `relation` (`id`, `tools_id`, `tech_id`) VALUES
(1, 26, 1),
(2, 26, 3),
(3, 12, 1),
(4, 12, 2),
(5, 13, 3),
(6, 13, 4),
(7, 14, 1),
(8, 14, 2),
(9, 14, 3),
(10, 14, 4),
(11, 15, 3),
(12, 15, 2),
(13, 16, 1),
(14, 16, 3),
(15, 16, 4),
(16, 17, 1),
(17, 17, 3),
(18, 23, 3),
(19, 23, 4),
(20, 27, 3),
(21, 27, 4),
(22, 28, 3),
(23, 29, 1),
(24, 29, 3),
(25, 30, 1),
(26, 30, 3),
(27, 30, 4),
(28, 31, 1),
(29, 31, 3),
(30, 32, 3),
(31, 18, 3),
(32, 18, 4),
(33, 19, 4),
(34, 20, 1),
(35, 20, 3),
(36, 21, 4),
(37, 34, 4),
(38, 33, 1),
(39, 33, 3),
(40, 35, 3),
(41, 35, 4),
(42, 36, 1),
(43, 36, 3),
(44, 36, 4),
(45, 37, 1),
(46, 39, 1),
(47, 39, 3),
(48, 39, 4),
(49, 38, 1),
(50, 38, 3),
(51, 8, 1),
(52, 8, 3),
(53, 40, 1),
(54, 40, 3),
(55, 9, 1),
(56, 9, 2),
(57, 9, 3),
(58, 10, 1),
(59, 10, 4),
(60, 41, 1),
(61, 42, 1),
(62, 42, 3),
(63, 4, 1),
(64, 4, 2),
(65, 3, 2),
(66, 3, 4),
(67, 2, 1),
(68, 2, 2),
(69, 2, 3),
(70, 2, 4),
(71, 1, 2),
(72, 1, 4),
(73, 43, 2),
(74, 43, 3),
(75, 43, 4),
(76, 7, 2),
(77, 7, 4),
(78, 6, 2),
(79, 6, 3),
(80, 5, 2),
(81, 5, 3),
(82, 5, 4),
(83, 44, 2),
(84, 11, 2),
(85, 11, 3),
(86, 11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sample`
--

CREATE TABLE `sample` (
  `id` int(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sample`
--

INSERT INTO `sample` (`id`, `name`, `time`) VALUES
(2, 'mango', '2022-11-13 10:34:38'),
(3, 'firts', '2022-11-13 10:35:10'),
(4, 'sahi', '2022-11-13 10:35:46');

-- --------------------------------------------------------

--
-- Table structure for table `technology`
--

CREATE TABLE `technology` (
  `tech_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `technology`
--

INSERT INTO `technology` (`tech_id`, `name`) VALUES
(1, 'Mobile'),
(2, 'Cloud'),
(3, 'Web App'),
(4, 'API');

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `id` int(11) NOT NULL,
  `tool_name` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `languages` varchar(1000) NOT NULL,
  `ref_link` varchar(500) NOT NULL,
  `rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`id`, `tool_name`, `description`, `languages`, `ref_link`, `rating`) VALUES
(1, 'Cloud Test Akamai', 'The SOASTA is the group that created CloudTest.\r\nOn mobile and web applications, load and performance testing is done.\r\nUsing CI/CD, developers can test API services and QA can automate tests.\r\n', 'Javascripts', 'https://www.akamai.com/', 4),
(2, 'Loadstorm', 'Cloud-load testing for web & mobile applications.', 'AJAX , Angular JS ,Web API (REST) ,Java HTML5 ,Flash,PHP ,Ruby, Silverlight', 'http://www.testingtoolsguide.net/tools/loadstorm/', 3.5),
(3, 'Cloudsleuth Spring', 'A distributed tracing solution for Spring Cloud called CloudSleuth aids in log data collection.  Distributed tracing is available.', 'Spring boot(java)', 'https://spring.io/', 4),
(4, 'Nessus tenable', 'It is a tool for assessing vulnerabilities. gives you visibility for your Google Cloud Platform, AWS, and Azure.', 'NASL', 'https://www.tenable.com/', 4.2),
(5, 'HCL AppScan on Cloud', 'HCLTech AppScan Standard is a Dynamic Analysis testing tool designed for security experts and pen-testers to use when performing security tests on web applications and web services. It runs automatic scans that explore and test web applications, and includes one of the most powerful scanning engines in the world.', 'Apex, ASP, C, C++, COBOL, ColdFusion, Go, Java, JavaScript(Client-side JavaScript, Kotlin, NodeJS, and AngularJS), .NET (C#, ASP.NET, VB.NET), .NET Core, Perl, PHP, PL/SQL, Python, Ruby, T-SQL, Swift, Visual Basic 6', 'https://cloud.appscan.com/', 4.6),
(6, 'Synk cloud', 'Detects cloud security vulnerabilities as soon as developers begin creating configurations, offering cloud, platform, and security teams professional advice on the tools and procedures they regularly employ.', 'Code AI Engine , C# , Go , Java , JavaScript , PHP , Python , Ruby ,TypeScript.', 'https://snyk.io/', 4),
(7, 'SonarCloud', 'With a solution that seamlessly connects into cloud DevOps platforms, you can empower your team to provide clean code consistently and effectively while extending your CI/CD workflow.', 'ABAP, C, C++, Objective-C, COBOL, C\\#, CSS, Flex, Go, HTML, Java, Javascript, Kotlin, PHP, PL/I, PL/SQL, Python, RPG, Ruby, Swift, T-SQL, TypeScript, VB6, VB, XML', 'https://www.sonarsource.com/products/sonarcloud/', 4),
(8, 'Kobiton', 'Using this robust cloud-based platform, manual and automated mobile and web testing may be carried out.', 'C#, Java, Ruby, NodeJS, PHP, and Python', 'https://www.kobiton.com/', 4.3),
(9, 'Perfecto', 'Mobile application designers and QA specialists can collaborate on services like enhanced automation, monitoring, and testing with the web-based SaaS (Software as a Service) platform known as Perfecto.', 'Java, JavaScript, C#, Python, PHP.', 'https://www.perfecto.io/', 4.4),
(10, 'Ranorex Studio', 'Ranorex Studio helps you build powerful tests without coding.', 'NET, Winforms, Java, SAP, WPF, HTML5, Flash, Flex, Windows Apps (Native/Hybrid), and iOS, Android.', 'https://www.ranorex.com/', 4),
(11, 'Cloud Defense', 'CloudDefense offers comprehensive threat information for all attack surfaces\r\nopen source libraries, APIs, containers, Kubernetes, and more.\r\n', 'Java, Python, Rust, or JS', 'https://www.clouddefense.ai/', 4.2),
(12, 'WebLOAD', 'WebLOAD is load testing tool, performance testing, stress test web applications. This web and mobile load testing and analysis tool is from RadView Software.', 'JavaScript', 'https://en.wikipedia.org/wiki/WebLOAD', 3),
(13, 'NetSparker or Invicti', 'Netsparker is a leading web vulnerability management software tool used by information technology, security operations, and development teams worldwide. Netsparker is a fully configurable Enterprise Dynamic Application Security Testing (DAST) tool.', 'css, js,html,php,java script ', 'https://www.invicti.com/product/', 4.7),
(14, 'Lamda Test', 'LambdaTest is a cloud-based cross browser testing tool that allows you to perform cross browser testing for web applications across more than 2000 browsers, operating systems, and devices. You can perform both manual and automated cross browser testing using LambdaTest.', 'c,c#, java script, php, python and Ruby etc.', 'https://www.lambdatest.com/', 4.7),
(15, 'Selenium', 'Selenium is a free (open-source) automated testing framework used to validate web applications across different browsers and platforms.', 'Ruby, Java, NodeJS, PHP, Perl, Python, and C#, among others.', 'https://www.selenium.dev/', 4.3),
(16, 'Katalon studio', 'Katalon Studio is an all-in-one test automation solution for web, API, mobile, and desktop built for both beginners and expert testers.', 'Groovy, Java', 'https://katalon.com/', 4.4),
(17, 'Testim', 'Testim is the leading AI-powered test automation platform for custom web applications. Testim enables fast authoring of AI-stabilized UI and end-to-end tests. Testim is also uniquely designed to help Agile teams efficiently manage and scale their automation projects.', 'java, javascript, typescript, python, and so on.', 'https://www.testim.io/', 3.1),
(18, 'Postman', 'This tool is used to build, modify and debug the API.', 'Java Script ,Python', 'https://www.softwaretestinghelp.com/api-testing-using-postman/', 4.1),
(19, 'Apigee', 'With Apigee, you can build API proxies—RESTful, HTTP-based APIs that interact with your services. With easy-to-use APIs, developers can be more productive, increasing your speed to market.', 'java Script, Java, python', 'https://cloud.google.com/apigee/docs/api-security', 4.1),
(20, 'JMeter', 'JMeter is a software that can perform load test, performance-oriented business (functional) test, regression test, etc., on different protocols or technologies', 'Java, Groovy, BeanShell scripting', 'http://pragmatictestlabs.com/2018/03/23/use-jmeter-performance-testing/', 3.7),
(21, 'Rest assured', 'Rest Assured enables you to test REST APIs using java libraries and integrates well with Maven.', 'Java, . Net, Python, Ruby.', 'https://rest-assured.io/', 3),
(22, 'SonarQube', '4', '', '', 0),
(23, 'Zed Attack Proxy(ZAP)', 'Zed Attack Proxy (ZAP) is a free, open-source penetration testing tool being maintained under the umbrella of the Open Web Application Security Project (OWASP). ZAP is designed specifically for testing web applications and is both flexible and extensible', 'java, python ,nodeJS, Ruby, .NET, PHP', 'https://www.zaproxy.org/', 4),
(24, 'JIRA', '4', '', '', 0),
(25, 'Netsparker', '4', '', '', 0),
(26, 'Experitest/digital.ai', 'Digital.ai continuous Testing helps teams increase test coverage and make data-driven decisions so they can deliver high-quality, error free web and mobile apps on time and at scale.', 'Ruby,java.', 'https://digital.ai/products/continuous-testing/', 4),
(27, 'Intruder', 'Intruder is a powerful vulnerability scanner that will help you uncover the many weaknesses lurking in your web applications and underlying infrastructure. Offering industry-leading security checks, continuous monitoring and an easy-to-use platform, Intruder keeps businesses of all sizes safe from hackers.', 'html,css,javascript,php,React etc', 'https://www.intruder.io/?utm_source=referral&utm_campaign=guru99-top-20-web-testing-tools', 4.9),
(28, 'Watin', 'A cross-platform web application testing tool, the latest version is 2.1 and developed in C# language. Due to the influence of Watir, Watin tested a web application written in .Net.', '.Net,Html5,AJAX', 'https://sourceforge.net/projects/watin/', 4.5),
(29, 'Watir', 'An open-source (BSD) cross-platform web application testing tool, pronounced as water. It is an easy and flexible automation tool of Ruby libraries for web browsers automation.Although, it is of Ruby libraries, supports applications written in any language and just like other languages, Ruby enables you to link to databases, export XML files, read files and spreadsheets, and organize your code as reusable libraries.', 'ruby,html,css,java script,php', 'http://watir.com/', 4),
(30, 'Load Impact', 'An online load testing tool used to test websites, web applications, mobile applications and APIs under heavy load for all platforms.\r\nLoad impact uses to test all applications/services and websites online, instead of setting-up offline to test the application. The testing process is very fast and simple. You can also repeat the test very easily in very little time.\r\n', 'Java Script,Go.', 'https://k6.io/cloud/', 3.6),
(31, 'Telerik Test Studio', 'A software testing tool is to test web and desktop applications of all Windows OS, developed by Telerik. It tests the functionality, performance, and load of the web, desktop, and mobile applications. The tool offers a plugin for Visual Studio and a standalone app that used to test the cross-browsing issue and have the same file form.', 'HTML, AJAX, Silverlight, ASP.NET MVC, JavaScript and WPF.', 'https://www.telerik.com/teststudio', 3.5),
(32, 'Wireshark', 'Wireshark is a packet sniffer and analysis tool. It captures network traffic from ethernet, Bluetooth, wireless (IEEE. 802.11), token ring, and frame relay connections, among others, and stores that data for offline analysis.', 'C,C++', 'https://www.wireshark.org/', 4.6),
(33, 'Parasoft', 'Parasoft, an API Testing tool helps in automated test case generation which can be reused and easily maintained and thus reduces a lot of regression effort. It supports end-to-end testing and has a very user-friendly interface.', 'Java, C, C++, or.NET', 'https://www.parasoft.com/products/parasoft-soatest/api-testing/', 4.7),
(34, 'Airborne', 'Airborne is an open-source API test automation framework.It can work with APIs which are written in Rails.t can work with Rack applications.', 'Ruby and RSpec', 'https://github.com/brooklynDev/airborne', 3),
(35, 'Rapise', 'This tool comes with an extensive feature list that satisfies different types of testing needs, one of them being the API testing. This supports testing SOAP Web services as well as REST web services.', 'Net', 'https://www.inflectra.com/Rapise/', 4.4),
(36, 'Synopsys', 'For assessing the security of mobile apps, Synopsys offers a complete solution. This remedy locates the potential risk in the mobile app and guarantees that it is safe to use. Mobile app security has a number of challenges, so Synopsys has created a unique mobile app security testing suite employing static and dynamic technologies.', 'C, C++, Java,C# , python ,API\'s, Javascripts,kotlin, php,ruby,swift.', 'https://www.synopsys.com/', 4.2),
(37, 'Drozer', 'MWR InfoSecurity created the Drozer mobile app security testing framework. It identifies security flaws in mobile applications and devices and makes sure that Android smartphones, mobile applications, etc. are safe to use.', 'java, R', 'https://labs.withsecure.com/tools/drozer', 3),
(38, 'Bug Hunter', 'A manual mobile testing tool called Bug Hunter is particularly developed for evaluating Android apps\' user interfaces. It may be used by human testers as well as Android developers and UI/UX designers who can verify the app or particular features before it moves on to the QA stage.', 'C, C++, LLVM bitcode, x86 binaries (via Ghidra), JVM bytecode (via Soot), and Javascript. Python, Java source code, Kotlin, and PHP.', 'https://www.bughunters.io/mobile-app-testing/', 4.1),
(39, 'Eggplant(Android and iOS)', 'It is useful for UI Automation and functional, Image-Based Testing, Mobile Testing, Network Testing, Web Testing, and Cross-Browser Testing.', 'C, C++, Java,C# , python and API\'s.', 'https://www.eggplantsoftware.com/', 4.1),
(40, 'StresStimulus', 'Load testing tool for websites, mobile and enterprise apps, from Stimulus Technology. End-to-end test wizard walks you through recording, configuring and executing tests.For mobile testing, record traffic from your Apple, Android, Windows phone or Blackberry mobile device, and then replay it to realistically emulate your user-base.', 'ASP.NET, Java, PHP.', 'https://www.stresstimulus.com/', 4.3),
(41, 'Headspin', 'Users of the HeadSpin Platform can remotely test and debug mobile, web, audio, and video applications on a huge variety of hardware. For a true user experience, test your app under several network scenarios.', 'Java, JavaScript, Python, Ruby, Node, and C#.', 'https://www.headspin.io/', 4),
(42, 'Avo Assure', 'With the help of the no-code, heterogeneous test automation tool Avo Assure, you can test mobile and web applications for both iOS and Android devices.', 'Java Script, Kotlin, Java, Swift, Typescript.', 'https://avoautomation.ai/', 4),
(43, 'LoadView', 'Cloud-based, fully-managed performance testing tool for web sites and API\'s (SOAP and REST) from Dotcom-Monitor.', 'Flash, HTML5, Java, PHP, JavaScript, Ruby, Silverlight, and more', 'https://www.loadview-testing.com/', 4.4),
(44, 'CodeScan Cloud', 'An unique static code scanning solution created especially for Salesforce DevOps is called CodeScan Shield. You can give your development team a strong tool for transparency, code quality, data security, and efficiency with our Salesforce code scanner.', 'Apex and Javascript', 'https://www.codescan.io/', 4.8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relation`
--
ALTER TABLE `relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sample`
--
ALTER TABLE `sample`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technology`
--
ALTER TABLE `technology`
  ADD PRIMARY KEY (`tech_id`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `relation`
--
ALTER TABLE `relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `sample`
--
ALTER TABLE `sample`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `technology`
--
ALTER TABLE `technology`
  MODIFY `tech_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
