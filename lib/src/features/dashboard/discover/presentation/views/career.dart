import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common/custom_text.dart';
import '../../../../../constant/colors.dart';

class CareerScreen extends StatefulWidget {
  const CareerScreen({super.key});

  @override
  State<CareerScreen> createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        title: CustomText(
          inputText: 'Jobs and Career',
          textAlign: TextAlign.start,
          fontSize: 20,
          weight: FontWeight.w700,
          color: AppColors.primaryColor,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16.h, right: 8.w, left: 8.w,bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240.h,
            width: double.maxFinite,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(image: AssetImage('assets/images/image 21.png'),fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:  EdgeInsets.all(12.0.sp),
                  child: CustomText(
                    inputText: 'Welcome from Professor Jane\nHarrington, the Vice-Chancellor',
                    textAlign: TextAlign.start,
                    fontSize: 14,
                    weight: FontWeight.w600,
                    color: AppColors.scaffoldBackground,
                  ),
                ),
              ],
            ),
            ),

            SizedBox(height: 10.h,),


            //
            //

            // We are making significant strides to understand and continuously improve our employees’ experience and we are committed to implementing progressive diversity talent management.',
            //
            CustomText(
              inputText: 'Welcome to the University of Greenwich. We are an ambitious and diverse community who take great pride in our institution’s 130-year history within the higher education sector. Our staff and students come from many walks of life and we value the talents and lived experience of each and every one of them. We believe in education without boundaries, supporting our students to achieve their ambitions because of, not despite, their background.' ,
            textAlign: TextAlign.start,
              fontSize: 12,
              weight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
            SizedBox(height: 10.h,),
            CustomText(
              inputText: 'We are a positive force for change, leading the way in student experience, impact-driven research and knowledge exchange. Our impressive reputation for teaching and learning earned us a Silver rating in the 2017 Teaching Excellence Framework and we offer students an extensive portfolio of academic programmes. With the help of our highly talented and motivated staff, we are building on these firm foundations and our goal is to become the best modern university in the UK.As well as offering a first-class learning experience for our students, we provide applied research and enterprise that is recognised nationally and internationally. Our research is regularly acknowledged as among the best in the world, with particular strengths in natural resources, pharmaceutical science and computational modelling.',
            textAlign: TextAlign.start,
              fontSize: 12,
              weight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
            SizedBox(height: 10.h,),
            CustomText(
              inputText: "Our three beautiful campuses in London and Kent foster a sense of community to build networks, relationships and connections that set our students up for life. All our campuses are founded upon our commitment to create successful partnerships, providing sector-leading facilities and attracting talent from all over the world.",
              textAlign: TextAlign.start,
              fontSize: 12,
              weight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
            SizedBox(height: 10.h,),
            RichText(
              text: TextSpan(
                text: 'We are looking for colleagues who share our values and behaviours, and have the dynamism, expertise and enthusiasm to thrive as part of our professional community. If you think you can help the university to continue to be a great place for teaching and research, please consider applying for one of the',
                style: GoogleFonts.montserrat(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor
                ),
                children:  <TextSpan>[
                  TextSpan(text: ' vacancies posted on our webpages',
                      style:GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            RichText(
              text: TextSpan(
                text: 'The university welcomes people from diverse and underrepresented communities who can help the university to achieve its mission. We do this through taking positive action such as encouraging applications from disabled and ',
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor
                ),
                children:  <TextSpan>[
                  TextSpan(text: 'Black, Asian and Minority Ethnic,',
                    style:GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                  ),
                  TextSpan(text: ' and',
                    style:GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                  ),
                  TextSpan(text: ' LGBT+ and non-conforming people.',
                    style:GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h,),
            RichText(
              text: TextSpan(
                text: 'As part of our commitment to',
                style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor
                ),
                children:  <TextSpan>[
                  TextSpan(text: ' Equality, Diversity and Inclusion Mentally Healthy Universities',
                    style:GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                  ),

                  TextSpan(text: ' we are committed to promoting and supporting the physical and mental health of all our staff, and removing barriers to improve inclusion. We encourage applicants to disclose experience of mental health problems so we can support them fully during our recruitment process and make any necessary reasonable adjustments. Any information disclosed will be kept confidential and separate from the job application form.',
                    style:GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
